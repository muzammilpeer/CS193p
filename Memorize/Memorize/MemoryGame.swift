//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Muzammil Peer on 04/06/2024.
//

import Foundation

//protocol Movable {
//    func move(by: Int)
//    var hasMoved:Bool  {get}
//    var distanceFromStart:Int  {get set}
//}
//
//struct PortableThing: Movable{
//    
//    func move(by: Int) {
//        
//    }
//    
//    var hasMoved: Bool
//    
//    var distanceFromStart: Int
//}


//struct Array<Element> where Element:Equatable
//some vs any


// function as types
//(Int,Int) -> Bool
//(Double) -> Void
//() -> List<String>
//() -> Void

//var foo:(Double) -> Void
//var doSomething(what ()->Bool)

//var operation: (Double) -> Double
//func square(operand:Double) -> Double
//    return operand*operand
//
//operation = square
//let result = operation(4)

struct MemoryGame<CardContent> {
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)-> CardContent) { // or Array<CardContent>
        self.cards = [] //[Card]()
        // add numberOfPairsOfCards x2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    private(set) var cards : Array<Card>
    func choose(_ card:Card){
        
    }
    
    struct Card {
        var isFaceUp:Bool=false
        var isMatched:Bool=false
        let content:CardContent
    }
}
