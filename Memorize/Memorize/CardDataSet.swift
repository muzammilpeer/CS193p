//
//  CardDataSet.swift
//  Memorize
//
//  Created by Muzammil Peer on 07/06/2024.
//

import Foundation

struct CardDataSet {
    let name: String
    var dataset: [String]
    let theme: ThemeSchema
}

let gameDatSet = [
    CardDataSet(name: "Halloween", dataset: ["👻", "🎃", "🕷", "🧟‍♂️", "🧛🏼‍♀️", "☠️", "👽", "🦹‍♀️", "🦇", "🌘", "⚰️", "🔮"], theme: Theme.orange),
    CardDataSet(name: "Flags", dataset: ["🇸🇬", "🇯🇵", "🏴‍☠️", "🏳️‍🌈", "🇬🇧", "🇹🇼", "🇺🇸", "🇦🇶", "🇰🇵", "🇭🇰", "🇲🇨", "🇼🇸"], theme: Theme.red),
    CardDataSet(name: "Animals", dataset: ["🦑", "🦧", "🦃", "🦚", "🐫", "🦉", "🦕", "🦥", "🐸", "🐼", "🐺", "🦈"], theme: Theme.green),
    CardDataSet(name: "Places", dataset: ["🗽", "🗿", "🗼", "🎢", "🌋", "🏝", "🏜", "⛩", "🕍", "🕋", "🏯", "🏟"], theme: Theme.blue),
    CardDataSet(name: "Sports", dataset: ["🤺", "🏑", "⛷", "⚽️", "🏀", "🪂", "🥏", "⛳️", "🛹", "🎣", "🏉", "🏓"], theme: Theme.purple),
    CardDataSet(name: "Foods", dataset: ["🌮", "🍕", "🍝", "🍱", "🍪", "🍩", "🥨", "🥖", "🍟", "🍙", "🍢", "🍿"], theme: Theme.yellow)
]
