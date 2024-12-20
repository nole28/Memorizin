//
//  EmojiMemoryGameView.swift
//  Memorizin
//
//  Created by Novak Velimirovic on 20.12.24..
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            ScrollView {
                cards
            }
            Button("Shuffle"){
                viewModel.shuffle()
                
            }
        }
        .padding()

    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(5)
                    
            }
        }
        .foregroundColor(.green)
    }
    
//    var cardCountAdjusters: some View {
//        HStack {
//            cardAdder
//            Spacer()
//            cardRemover
//        }
//        .padding()
//        .imageScale(.large)
//        .font(.largeTitle)
//    }
//    
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button(action: {
//            cardCount += offset
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > emoji.count)
//    }
//    
//    var cardAdder: some View {
//        cardCountAdjuster(by: +1, symbol: "plus")
//        
//    }
//    
//    var cardRemover: some View {
//        cardCountAdjuster(by: -1, symbol: "minus")
//    }
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 25.0)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.1)
                    .aspectRatio(contentMode: .fit)
                    
                
            }
                .opacity(card.isFaceUp ? 1 : 0)
                base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
            
        }
        
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
