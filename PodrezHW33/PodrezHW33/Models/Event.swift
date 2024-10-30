//
//  Event.swift
//  PodrezHW33
//
//  Created by Oleg Podrez on 30.10.24.
//

import Foundation

struct Event: Codable {
    let title: String
    let date: Date
    let notificationInterval: TimeInterval
}

