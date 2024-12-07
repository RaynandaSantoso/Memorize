//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Raynanda on 01/12/24.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
            
    }
    
    struct Card {
        var isFaceUP: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
}
