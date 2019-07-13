//
//  Card.swift
//  concentration
//
//  Created by Stephen lee on 6/12/19.
//  Copyright © 2019 Stephen lee. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    internal func hash(into hasher: inout Hasher) {
        hasher.combine(self.identifier)
    }
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory;
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
