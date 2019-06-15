//
//  Concentration.swift
//  concentration
//
//  Created by Stephen lee on 6/10/19.
//  Copyright © 2019 Stephen lee. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfFacedUpCard: Int?
    
    func chooseCard(at index: Int) {
        
        // card is not matched
        if !cards[index].isMatched {
            if let matchIndex = indexOfFacedUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfFacedUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfFacedUpCard = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }

        cards = cards.shuffled()
    }
}
