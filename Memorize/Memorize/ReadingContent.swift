
// protocol Movable {
//    func move(by: Int)
//    var hasMoved:Bool  {get}
//    var distanceFromStart:Int  {get set}
// }
//
// struct PortableThing: Movable{
//
//    func move(by: Int) {
//
//    }
//
//    var hasMoved: Bool
//
//    var distanceFromStart: Int
// }

// struct Array<Element> where Element:Equatable
// some vs any

// function as types
// (Int,Int) -> Bool
// (Double) -> Void
// () -> List<String>
// () -> Void

// var foo:(Double) -> Void
// var doSomething(what ()->Bool)

// var operation: (Double) -> Double
// func square(operand:Double) -> Double
//    return operand*operand
//
// operation = square
// let result = operation(4)

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

// func createCardContent(forPairAtIndex index:Int) -> String {
//    return ["🎃", "👻", "🕸️", "🧛‍♂️", "🧙‍♀️", "😜", "🤡", "😂", "👽", "💀", "😈", "🤖", "👺", "👹", "🍬"][index]
// }

// StateObject lifetime is equal to application lifetime

// StateObject
// State
//
// ObservedObject
// Published
// .send()
//
// MainActor
// async
// await

//
// When you are syntaize in == equitable all variables no need to define it in swift swift can do it for you automatically
//        static func == (lhs: Card, rhs: Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp &&
//            lhs.isMatched == rhs.isMatched &&
//            lhs.content == rhs.content
//        }
//

// Enums:
// enum FastFoodMenuItem {
//    case humburger(numberOfPatties: Int)
//    case fries(size: FryOrderSize)
//    case drink(String, ounces: Int) // the unnamed String in the brand, e.g "Coke"
//    case cookie
//
//    func isIncludedInSpecialOrder(number: Int) -> Bool {
//        switch self {
//        case .humburger(numberOfPatties: let pattyCount): return pattyCount == number
//        case .fries, .cookie: return true
//        case .drink(_, ounces: let ounces): return ounces == 16
//        }
//    }
// }
//
// enum FryOrderSize {
//    case large
//    case small
// }
//
// let menuItem: FastFoodMenuItem = .humburger(numberOfPatties: 2)
// var otherItem: FastFoodMenuItem = .cookie

// var yetAnotherItem = .cookie // swift can't figure this out type infering on both size not possible. only right side is allowed

// enum can have function and computed properties inside it but not stored properties

// enum TeslaModel: CaseIterable {
//    case X
//    case S
//    case Three
//    case Y
// }

// TeslaModel.allCases

// for model in TeslaModel.allCases {
//    reportSalesNumbers(for:model)
// }
// func reportSalesNumbers(for model:TeslaModel) {
//    switch model
//    {
//
//    }
// }
// behind the scene compiler is doing this enum for value? for optional to build an enum
// enum Optional<T> {
//    case none
//    case some(<T>)
// }

// var hello:String?                           //var hello:Optional<String> = .none
// var hello :String? = "hello"                //var hello:Optional<String> = .some("hello")
// var hello: String ? = nil                   //var hello:Optional<String> = .none

// let hello:String? = "hello"
// print(hello!)
// switch hello {
//    case .none" // raise an exception(crash)
//    case .some(let data): print(data)
// }
//
//
// if let safehello = hello {
// print(safehello)
// }else {
//    //do something
// }
// switch hello {
// case .none : {// do something}
// case .some(let safehello): print(safehello)
// }

// let x:String = "hel"
// let y = x ?? "foo"
//
// switch x {
//    case .none : y = "foo"
//    case .some (let data):  y = data
// }
