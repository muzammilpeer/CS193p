//
//  ContentView.swift
//  Memorize
//
//  Created by Muzammil Peer on 29/05/2024.
//

import SwiftUI

struct ContentView: View {
    let themeColor = Color.orange
    let emojisList:Array<String> = ["🎃", "👻", "🕸️", "🧛‍♂️", "🧙‍♀️", "😜", "🤡", "😂", "👽", "💀", "😈", "🤖", "👺", "👹", "🍬"]
    @State var cardCount:Int = 4 // default load 4 items only
    
    var body: some View {
        VStack{
            ScrollView{
                cardsGrid
            }
            Spacer()
            bottomButtons
        }.padding()
        
    }
    
    var cardsGrid: some View { LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))], content: {
        ForEach(0..<cardCount,id:\.self) { index in
            CardView(isFaceUp: true,content:emojisList[index])
        }.aspectRatio(2/3,contentMode: .fit)
    })
    .foregroundColor(themeColor)
    .padding()
    }
    
    var bottomButtons: some View {
        HStack{
            cardCountAdjusterBy(offset: -1, symbol: "folder.fill.badge.minus")
            Spacer()
            cardCountAdjusterBy(offset: +1, symbol: "folder.fill.badge.plus")
        }
    }
    
    func cardCountAdjusterBy(offset:Int, symbol:String) -> some View {
        Button(action: {
            cardCount+=offset
        }, label: {
            Image(systemName: symbol).font(.largeTitle)
        }).disabled(cardCount+offset < 1 || cardCount+offset > emojisList.count).tint(themeColor)
    }
}



struct CardView: View {
    @State var isFaceUp: Bool = true
    let content:String
    var body: some View {
        ZStack {
            let baseRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                baseRectangle.fill(.white)
                baseRectangle.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(self.isFaceUp ? 1 : 0)
            baseRectangle.opacity(self.isFaceUp ? 0 : 1)
        }.onTapGesture {
            self.isFaceUp = !self.isFaceUp
        }
    }
}

#Preview {
    ContentView()
}
