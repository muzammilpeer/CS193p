//
//  EmojoMemoryGame.swift
//  Memorize
//
//  Created by Muzammil Peer on 04/06/2024.
//

import SwiftUI

class EmojoMemoryGame: ObservableObject {
    //    static vars and function initialized before instance variables or functions
    class func createMemoryGame(emojis: [String]) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: emojis.count) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                emojis[pairIndex]
            } else {
                "⁉️"
            }
        }
    }

    init(cardDatSet: CardDataSet) {
        self.model = EmojoMemoryGame.createMemoryGame(emojis: cardDatSet.dataset)
        self.theme = cardDatSet.theme
        self.cardName = cardDatSet.name
    }

    @Published private var model: MemoryGame<String>
    @Published private var theme: ThemeSchema
    @Published private var cardName: String

    var cards: [MemoryGame<String>.Card] {
        return self.model.cards
    }

    var score: Int {
        self.model.score
    }

    var currentTheme: ThemeSchema {
        self.theme
    }

    var currentCardName: String {
        self.cardName
    }

    // MARK: - Intents

    func shuffle() {
        self.model.shuffle()
    }

    func choose(_ card: MemoryGame<String>.Card) {
        self.model.choose(card)
    }

    func newGame() {
        let cardDatSet = gameDatSet.randomElement()!
        self.model = EmojoMemoryGame.createMemoryGame(emojis: cardDatSet.dataset)
        self.theme = cardDatSet.theme
        self.cardName = cardDatSet.name
    }
}
