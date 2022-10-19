//
//  String+Extensions.swift
//  CoolChatTwitchPlus
//
//  Created by Maegan Wilson on 10/18/22.
//

import Foundation
extension StringProtocol where Self: RangeReplaceableCollection {
    func removingPrefix(_ prefix: String) -> Self {
        guard hasPrefix(prefix) else { return self }
        var copy = self
        copy.removeFirst(prefix.count)
        return copy
    }
}
