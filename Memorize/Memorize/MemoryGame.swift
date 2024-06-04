//
//  MemoryGame.swift
//  Memorize
//
//  Created by Muzammil Peer on 04/06/2024.
//

import Foundation


struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) { // or Array<CardContent>
        self.cards = [] // [Card]()
        // add numberOfPairsOfCards x2 cards
        for pairIndex in 0 ..< max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            self.cards.append(Card(content: content))
            self.cards.append(Card(content: content))
        }
    }

    func choose(_ card: Card) {}
    mutating func shuffle() {
        cards.shuffle()
    }
    struct Card {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
    }
}
