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
    private(set) var cards = [Card]()
    
    private var indexOfFacedUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index): chosen index not in the cards")
        // card is not matched
        if !cards[index].isMatched {
            if let matchIndex = indexOfFacedUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfFacedUpCard = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.chooseCard(at: \(index): chosen index not in the cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }

        cards = cards.shuffled()
    }
}
