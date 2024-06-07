//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Muzammil Peer on 29/05/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojoMemoryGame
    var score: Int = 0
    var buttonFont: Font = .title3
    var titleFont: Font = .title
    var subTitleFont: Font = .title2

    var themeColor: Color
    var themeAccentColor: Color

    init(viewModel: EmojoMemoryGame) {
        self.viewModel = viewModel
        self.themeColor = viewModel.currentTheme.color
        self.themeAccentColor = viewModel.currentTheme.accentColor
    }

    var body: some View {
        VStack {
            Text("Memorize Game").font(self.titleFont).foregroundColor(self.themeAccentColor)
            Text(self.viewModel.currentCardName).font(self.subTitleFont).foregroundColor(self.themeAccentColor)
            ScrollView {
                self.cardsGrid.animation(.default, value: self.viewModel.cards)
            }
            Spacer()
            self.bottomButtons
        }.padding()
    }

    var cardsGrid: some View { LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0, content: {
        ForEach(self.viewModel.cards) { card in
            CardView(card: card).aspectRatio(2 / 3, contentMode: .fit).padding(4).onTapGesture {
                self.viewModel.choose(card)
            }.animation(.snappy(duration: 1), value: card.isMatched)
        }
    })
    .foregroundColor(self.themeColor)
    }

    var bottomButtons: some View {
        HStack {
            Button(action: { self.viewModel.newGame() },
                   label: {
                       VStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, content: {
                           Image(systemName: "plus.circle")
                           Text("New Game")
                       })
                   }).tint(self.themeColor).font(self.buttonFont)
            Spacer()
            VStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, content: {
                Text("Score:\(self.score)").font(self.buttonFont).foregroundColor(self.themeAccentColor)
            })
            Spacer()
            Button(action: { self.viewModel.shuffle() },
                   label: {
                       VStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, content: {
                           Image(systemName: "shuffle.circle")
                           Text("Shuffle")
                       })
                   }).tint(self.themeColor).font(self.buttonFont)
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let baseRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                baseRectangle.fill(.white)
                baseRectangle.strokeBorder(lineWidth: 2)
                Text(self.card.content).font(.system(size: 200)).minimumScaleFactor(0.01).aspectRatio(1, contentMode: .fit)
            }.opacity(self.card.isFaceUp ? 1 : 0)
            baseRectangle.opacity(self.card.isFaceUp ? 0 : 1)
        }.opacity(self.card.isFaceUp || !self.card.isMatched ? 1 : 0)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojoMemoryGame(cardDatSet: gameDatSet.randomElement()!))
}
