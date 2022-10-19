//
//  ContentView.swift
//  CoolChatTwitchPlus
//
//  Created by Maegan Wilson on 10/18/22.
//
//  Comment Redemptions:
//  MikaelaCaron 2022-10-18
//

import SwiftUI
import TwitchChat

extension ChatMessage: Identifiable {
    public var id: UUID {
        UUID()
    }
}

class CCTChat: ObservableObject {
    @Published var lastChat: [ChatMessage] = []

    let chat = TwitchChat(token: ProcessInfo.processInfo.environment["UserToken"]!, name: "mwilson_codes")

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

struct ContentView: View {
    @StateObject var chat = CCTChat()

    var body: some View {
        VStack {
            Text("Chat")
            List(chat.lastChat) { chatMessage in
                Text(chatMessage.text)
            }
        }.task {
            await chat.startListening()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
