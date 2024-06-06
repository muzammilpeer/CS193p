//
//  Theme.swift
//  Memorize
//
//  Created by Muzammil Peer on 07/06/2024.
//

import SwiftUI

struct ThemeSchema {
    var color: Color
    var accentColor: Color
}

enum Theme {
    static let orange: ThemeSchema = .init(color: .orange, accentColor: .red)
    static let red: ThemeSchema = .init(color: .red, accentColor: .blue)
    static let green: ThemeSchema = .init(color: .green, accentColor: .yellow)
    static let blue: ThemeSchema = .init(color: .blue, accentColor: .green)
    static let purple: ThemeSchema = .init(color: .purple, accentColor: .orange)
    static let yellow: ThemeSchema = .init(color: .yellow, accentColor: .red)
}
