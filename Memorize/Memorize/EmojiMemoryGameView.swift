//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Muzammil Peer on 29/05/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojoMemoryGame
    @State var themeColor = Color.orange

    var body: some View {
        VStack {
            ScrollView {
                self.cardsGrid
            }
            Spacer()
            self.bottomButtons
        }.padding()
    }

    var cardsGrid: some View { LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0, content: {
        ForEach(self.viewModel.cards.indices, id: \.self) { index in
            CardView(card: self.viewModel.cards[index])
        }.aspectRatio(2 / 3, contentMode: .fit).padding(4)
    })
    .foregroundColor(self.themeColor)
    }

    func themSelector(color: Color) -> some View {
        Button(action: {
            self.themeColor = color
        }, label: {
            VStack {
                Image(systemName: "pencil.circle").tint(color)
                Text(color.description).tint(color)
            }
        }).tint(self.themeColor)
    }

    var bottomButtons: some View {
        HStack {
            Button("Shuffle") {
                self.viewModel.shuffle()
            }
            Spacer()
            self.themSelector(color: .orange)
            self.themSelector(color: .red)
            self.themSelector(color: .green)
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
        }.onTapGesture {}
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojoMemoryGame())
}
