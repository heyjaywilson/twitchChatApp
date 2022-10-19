//
//  CCTChat.swift
//  CoolChatTwitchPlus
//
//  Created by Maegan Wilson on 10/18/22.
//

import Foundation
import TwitchChat
import UserNotifications

class CCTChat: ObservableObject {
    @Published var lastChat: [ChatMessage] = []

    let chat = TwitchChat(token: ProcessInfo.processInfo.environment["UserToken"]!, name: "mwilson_codes")

    let center = UNUserNotificationCenter.current()

    @MainActor
    func startListening() async {
        do {
            for try await message in chat.messages {
                print("message received")
                lastChat.append(message)
                makeNotification(from: message)
            }
        } catch {
            print(error)
        }
    }

    func makeNotification(from message: ChatMessage) {
        let content = UNMutableNotificationContent()
        content.title = message.sender
        content.body = message.text

        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: nil)

        center.add(request) { (error) in
           if error != nil {
              // Handle any errors.
           }
        }
    }
}
