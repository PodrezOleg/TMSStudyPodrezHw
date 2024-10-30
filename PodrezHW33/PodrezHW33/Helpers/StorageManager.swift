//
//  StorageManager.swift
//  PodrezHW33
//
//  Created by Oleg Podrez on 30.10.24.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    private let eventsKey = "events"
//    ?????
    private init() {}
    
    func saveEvent(event: Event) {
        var events = loadEvents()
        events.append(event)
        if let data = try? JSONEncoder().encode(events) {
            UserDefaults.standard.set(data, forKey: eventsKey)
        }
    }
    func loadEvents() -> [Event] {
        if let data = UserDefaults.standard.data(forKey: eventsKey),
           let events = try?JSONDecoder().decode([Event].self, from: data) {
            return events
        }
        return []
    }
}
