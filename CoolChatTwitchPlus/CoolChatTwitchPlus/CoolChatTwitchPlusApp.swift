//
//  CoolChatTwitchPlusApp.swift
//  CoolChatTwitchPlus
//
//  Created by Maegan Wilson on 10/18/22.
//

import SwiftUI
import UserNotifications

@main
struct CoolChatTwitchPlusApp: App {
    @AppStorage(UD_KEYS.firstLaunch) var firstLaunch = false
    let center = UNUserNotificationCenter.current()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    if firstLaunch {
                        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in

                            if let error = error {
                                print(error)
                            }
                        }
                    }
                }
        }
    }
}
