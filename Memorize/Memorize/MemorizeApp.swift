//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Muzammil Peer on 29/05/2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojoMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: self.game)
        }
    }
}
