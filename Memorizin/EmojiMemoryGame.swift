//
//  EmojiMemoryGame.swift
//  Memorizin
//
//  Created by Novak Velimirovic on 4.1.25..
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    private static let emoji = ["👽","🥷🏿","🦜","🐍","🍄","🐞","🐥","🌝","⭐️","🔥","☕️","🎱","🎲","💊","♐️","🗿","🏆","🥊"]
        
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 5) {  pairIndex in
            if emoji.indices.contains(pairIndex) {
                return emoji[pairIndex]
            } else {
                return "🧻"
            }
        }
    }
    
    @Published private var model = createMemoryGame()

    //MARK: - Intent 1
    func shuffle() {
        model.shuffle()
    }

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
