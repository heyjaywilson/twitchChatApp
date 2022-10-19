//
//  CCTChat.swift
//  CoolChatTwitchPlus
//
//  Created by Maegan Wilson on 10/18/22.
//

import Foundation
import TwitchChat

class CCTChat: ObservableObject {
    @Published var lastChat: [ChatMessage] = []

    let chat = TwitchChat(token: ProcessInfo.processInfo.environment["UserToken"]!, name: "mwilson_codes")

    @MainActor
    func startListening() async {
        do {
            for try await message in chat.messages {
                print("message received")
                lastChat.append(message)
            }
        } catch {
            print(error)
        }
    }
}
