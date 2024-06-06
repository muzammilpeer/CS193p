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
    }

    private func index(of card: Card) -> Int? {
        for index in self.cards.indices {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return nil
    }

    var lastUnknowLocation: Int?

    mutating func choose(_ card: Card) {
        // builtin array function
//        if let chosenIndex = cards.firstIndex(of: card) {
//            cards[chosenIndex].isFaceUp.toggle()
//        }
//        or
//        if let chosenIndex = index(of: card){
//            cards[chosenIndex].isFaceUp.toggle()
//        }
//        or use another builting where
//        if let chosenIndex = cards.firstIndex(where: { cardToCheck in
//            cardToCheck.id == card.id
//        }){
//            cards[chosenIndex].isFaceUp.toggle()
//        }
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !self.cards[chosenIndex].isFaceUp && !self.cards[chosenIndex].isMatched {
                if let knownLocation = lastUnknowLocation, cards[chosenIndex].content == cards[knownLocation].content {
                    self.cards[chosenIndex].isMatched = true
                    self.cards[knownLocation].isMatched = true

//                    cards[chosenIndex].isFaceUp = false
                    self.cards[knownLocation].isFaceUp = false
                    self.lastUnknowLocation = nil
                } else {
                    for index in self.cards.indices {
                        self.cards[index].isFaceUp = false
                    }
//                    if let knownLocation = lastUnknowLocation {
//                        cards[knownLocation].isFaceUp = true
//                    }
                    self.lastUnknowLocation = chosenIndex
                    self.cards[chosenIndex].isFaceUp = true
                }
                print("lastUnknowLocation:\(self.lastUnknowLocation), chosenIndex:\(chosenIndex)")
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
