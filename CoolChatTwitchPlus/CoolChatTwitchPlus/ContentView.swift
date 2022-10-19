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

struct ContentView: View {
    @StateObject var chat = CCTChat()

    var body: some View {
        VStack {
            Text("Chat")
            List(chat.lastChat) { chatMessage in
                HStack {
                    Text(chatMessage.sender)
                        .foregroundColor(chatMessage.color)
                    Text(chatMessage.text)
                }
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
