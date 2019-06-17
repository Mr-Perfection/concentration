//
//  ViewController.swift
//  concentration
//
//  Created by Stephen lee on 6/4/19.
//  Copyright © 2019 Stephen lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = String(flipCount)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet private var cardButtons: [UIButton]!

    @IBOutlet private weak var flipCountLabel: UILabel!

    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("cardButton is not in the cardButtons collection.")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(getEmoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.4692499042, green: 1, blue: 0.4018194973, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }
    }
    
    private func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.4692499042, green: 1, blue: 0.4018194973, alpha: 1)
        }
    }
    
    private var emojis = ["🧠", "🦷", "😇", "🎳", "🚀", "🛸", "💿"]
    private var emojiDict = [Int : String]()
    private func getEmoji(for card: Card) -> String {
        if emojiDict[card.identifier] == nil, emojis.count > 0 {
            let randomNumber = Int(arc4random_uniform(UInt32(emojis.count)))
            emojiDict[card.identifier] = emojis[randomNumber]
            
            emojis.remove(at: randomNumber)
            
        }
        return emojiDict[card.identifier] ??  "?"
    }
}

