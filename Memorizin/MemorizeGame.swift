//
//  MemorizeGame.swift
//  Memorizin
//
//  Created by Novak Velimirovic on 4.1.25..
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardFactory: (Int) -> CardContent ) {
        cards = []
        //numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var oneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
                //  return faceUpCards.count == 1 ? faceUpCards.first : nil
        
        
        set {
            cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0 ) }
            //            for index in cards.indices {
            //                if index == newValue {
            //                    cards[index].isFaceUp = true
            //                } else {
            //                    cards[index].isFaceUp = false
            //                }
            //            }
        }
    }
    
    
    mutating func choose(card: Card) {
        print("chose \(card)")
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = oneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                }else{
//                    for index in cards.indices {
//                        cards[index].isFaceUp = false
//                    }
                    
                    oneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomStringConvertible {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: String
        var description: String {
            "\(id): \(content) \(isFaceUp ? "up " : "down")\(isMatched ? " matched " : " unmatched")"
            
            
        }
    }
}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
