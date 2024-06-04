//
//  EmojoMemoryGame.swift
//  Memorize
//
//  Created by Muzammil Peer on 04/06/2024.
//

import SwiftUI



class EmojoMemoryGame: ObservableObject {
    //    static vars and function initialized before instance variables or functions
    private static let emojis = ["🎃", "👻", "🕸️", "🧛‍♂️", "🧙‍♀️", "😜", "🤡", "😂", "👽", "💀", "😈", "🤖", "👺", "👹", "🍬"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 16) { pairIndex in
            if self.emojis.indices.contains(pairIndex) {
                return self.emojis[pairIndex]
            } else {
                return "🚦"
            }
        }
    }
    
    
    @Published private var model = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return self.model.cards
    }
    
    // MARK: - Intents
    func shuffle() {
        model.shuffle()
//        objectWillChange.send() # manually send or use @Published(in model) and @ObservedObject in View
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        self.model.choose(card)
    }
    
}
