//
//  MemorizinApp.swift
//  Memorizin
//
//  Created by Novak Velimirovic on 20.12.24..
//

import SwiftUI

@main
struct MemorizinApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
