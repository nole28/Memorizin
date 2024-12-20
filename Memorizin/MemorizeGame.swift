//
//  MemorizeGame.swift
//  Memorizin
//
//  Created by Novak Velimirovic on 4.1.25..
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardFactory: (Int) -> CardContent ) {
        cards = []
        //numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }

    
    func choose(card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    struct Card  {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
    
    
}
