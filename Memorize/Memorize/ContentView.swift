//
//  ContentView.swift
//  Memorize
//
//  Created by Muzammil Peer on 29/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State var themeColor = Color.orange
    
    let emojisList: [String] = ["🎃", "👻", "🕸️", "🧛‍♂️", "🧙‍♀️", "😜", "🤡", "😂", "👽", "💀", "😈", "🤖", "👺", "👹", "🍬"]
    @State var cardCount: Int = 4 // default load 4 items only

    var body: some View {
        VStack {
            ScrollView {
                self.cardsGrid
            }
            Spacer()
            self.bottomButtons
        }.padding()
    }

    var cardsGrid: some View { LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))], content: {
        ForEach(0 ..< self.cardCount, id: \.self) { index in
            CardView(isFaceUp: true, content: self.emojisList[index])
        }.aspectRatio(2 / 3, contentMode: .fit)
    })
    .foregroundColor(self.themeColor)
    .padding()
    }

    var bottomButtons: some View {
        HStack {
            self.cardCountAdjusterBy(offset: -1, symbol: "folder.fill.badge.minus")
            Spacer()
            themSelector(color: .orange)
            themSelector(color: .red)
            themSelector(color: .green)
            Spacer()
            self.cardCountAdjusterBy(offset: +1, symbol: "folder.fill.badge.plus")
            
        }
    }

    func themSelector(color: Color) -> some View {
        Button(action: {
            themeColor = color
        }, label: {
            VStack{
                Image(systemName: "pencil.circle").tint(color)
                Text(color.description).tint(color)
            }
        }).tint(self.themeColor)
    }
    
    func cardCountAdjusterBy(offset: Int, symbol: String) -> some View {
        Button(action: {
            self.cardCount += offset
        }, label: {
            Image(systemName: symbol).font(.largeTitle)
        }).disabled(self.cardCount + offset < 1 || self.cardCount + offset > self.emojisList.count).tint(self.themeColor)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    let content: String
    var body: some View {
        ZStack {
            let baseRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                baseRectangle.fill(.white)
                baseRectangle.strokeBorder(lineWidth: 2)
                Text(self.content).font(.largeTitle)
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
