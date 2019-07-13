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
            let faceUpCardIndex = cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
            
            return faceUpCardIndex
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
                if cards[matchIndex] == cards[index] {
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
        assert(numberOfPairsOfCards > 0, "Concentration.chooseCard(at: \(String(describing: index)): chosen index not in the cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }

        cards = cards.shuffled()
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
    
}
