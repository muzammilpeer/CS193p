//
//  MemoryGame.swift
//  Memorize
//
//  Created by Muzammil Peer on 04/06/2024.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    var score:Int=0

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
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }

    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }

    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    cards[chosenIndex].flippedCount+=1
                    cards[potentialMatchIndex].flippedCount+=1
                    
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score+=1
                    }else if cards[chosenIndex].flippedCount > 1 || cards[potentialMatchIndex].flippedCount > 1 {
                        score-=1
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
                cards[chosenIndex].flippedCount+=1
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
        var flippedCount:Int=0
        var debugDescription: String {
            "\(self.id): \(self.isFaceUp ? "up" : "down") \(self.isMatched ? "matched" : "not matched") flippedCount:\(flippedCount)"
        }
    }
}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
