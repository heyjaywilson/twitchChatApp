//
//  ChatMessage+Extension.swift
//  CoolChatTwitchPlus
//
//  Created by Maegan Wilson on 10/18/22.
//

import Foundation
import TwitchChat
import SwiftUI

extension ChatMessage: Identifiable {
    public var id: UUID {
        UUID()
    }

    public var color: Color {
        guard let senderColor else {
            return .primary
        }
        return Color(hexString: senderColor) ?? .primary
    }
}

extension Color {
    init(hexLiteral hex: Int) {
        let red = CGFloat((hex & 0xFF0000) >> 16)
        let green = CGFloat((hex & 0x00FF00) >> 8)
        let blue = CGFloat((hex & 0x0000FF) >> 0)

        self.init(red: red / 255,
                  green: green / 255,
                  blue: blue / 255)
    }

    init?(hexString: String) {
        guard let int = Int(hexString.removingPrefix("#"), radix: 16) else { return nil }
        self.init(hexLiteral: int)
    }
}
