//
//  MemoryGame.swift
//  Memorize
//
//  Created by Muzammil Peer on 04/06/2024.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) { // or Array<CardContent>
        self.cards = [] // [Card]()
        // add numberOfPairsOfCards x2 cards
        for pairIndex in 0 ..< max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            self.cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            self.cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
        self.cards.shuffle()
    }

    private func index(of card: Card) -> Int? {
        for index in self.cards.indices {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return nil
    }

    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { self.cards.indices.filter { index in self.cards[index].isFaceUp }.only }
        set { self.cards.indices.forEach { self.cards[$0].isFaceUp = (newValue == $0) } }
    }

    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !self.cards[chosenIndex].isFaceUp && !self.cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if self.cards[chosenIndex].content == self.cards[potentialMatchIndex].content {
                        self.cards[chosenIndex].isMatched = true
                        self.cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    self.indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                self.cards[chosenIndex].isFaceUp = true
            }
        }
    }

    mutating func shuffle() {
        self.cards.shuffle()
    }

    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent

        var id: String
        var debugDescription: String {
            "\(self.id): \(self.isFaceUp ? "up" : "down") \(self.isMatched ? "matched" : "not matched")"
        }
    }
}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}