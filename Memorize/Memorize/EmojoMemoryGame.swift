//
//  EmojoMemoryGame.swift
//  Memorize
//
//  Created by Muzammil Peer on 04/06/2024.
//

import SwiftUI

// func createCardContent(forPairAtIndex index:Int) -> String {
//    return ["🎃", "👻", "🕸️", "🧛‍♂️", "🧙‍♀️", "😜", "🤡", "😂", "👽", "💀", "😈", "🤖", "👺", "👹", "🍬"][index]
// }

class EmojoMemoryGame {
    //    static vars and function initialized before instance variables or functions
    private static let emojis = ["🎃", "👻", "🕸️", "🧛‍♂️", "🧙‍♀️", "😜", "🤡", "😂", "👽", "💀", "😈", "🤖", "👺", "👹", "🍬"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            if self.emojis.indices.contains(pairIndex) {
                return self.emojis[pairIndex]
            } else {
                return "🚦"
            }
        }
    }

    //    function as type
    //    private var model = MemoryGame(numberOfPairsOfCards: 4, cardContentFactory: createCardContent)
    // clousre
    //    private var model = MemoryGame(numberOfPairsOfCards: 4, cardContentFactory: {(index:Int) -> String in
    //        return ["🎃", "👻", "🕸️", "🧛‍♂️", "🧙‍♀️", "😜", "🤡", "😂", "👽", "💀", "😈", "🤖", "👺", "👹", "🍬"][index]
    //    }
    //    )
    //    clousure syntax wit type inferring
    //    private var model = MemoryGame(numberOfPairsOfCards: 4, cardContentFactory: { index in
    //        return ["🎃", "👻", "🕸️", "🧛‍♂️", "🧙‍♀️", "😜", "🤡", "😂", "👽", "💀", "😈", "🤖", "👺", "👹", "🍬"][index]
    //    }
    //    )
    // trailing clousre syntax , you can use $0,1,2 etc as well but its not readable
    //    private var model = MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
    //        return emojis[pairIndex]
    //    }

    private var model = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return self.model.cards
    }

    func choose(_ card: MemoryGame<String>.Card) {
        self.model.choose(card)
    }
}
