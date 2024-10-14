
//  ReplaceName.swift
//  HW30
//
//  Created by Oleg Podrez on 13.10.24.
//

import Foundation

class ReplaceName {
    static func replacePlayerName(in text: String, with playerName: String) -> String {
        return text.replacingOccurrences(of: "{name}", with: playerName)
    }
}
