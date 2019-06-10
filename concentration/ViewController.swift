//
//  ViewController.swift
//  concentration
//
//  Created by Stephen lee on 6/4/19.
//  Copyright © 2019 Stephen lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let emojis = ["🧠", "🦷", "😇", "😇", "🎳", "🧠", "🚀", "🦷"]
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = String(flipCount)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var cardButtons: [UIButton]!

    @IBOutlet weak var flipCountLabel: UILabel!

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojis[cardNumber], on: sender)
        } else {
            print("cardButton is not in the cardButtons collection.")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        flipCount+=1
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.4692499042, green: 1, blue: 0.4018194973, alpha: 1)
        }
    }
}

