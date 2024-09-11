//
//  CityView.swift
//  PodrezHw24
//
//  Created by Oleg Podrez on 10.09.24.
//

import Foundation

struct City {
    let name: String
    let timeZone: Int
    
    func showCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        
        let currentDate = Date()
        let timeZoneSeconds = timeZone * 3600
        let localDate = currentDate.addingTimeInterval(TimeInterval(timeZoneSeconds))
        return formatter.string(from: localDate)
    }
}

let cities = [
City(name: "Tokyo", timeZone: 9),
City(name: "Sydney", timeZone: 10),
City(name: "Dallas", timeZone: -5),
City(name: "Cape Town", timeZone: 2),
City(name: "Santiago", timeZone: -3),
City(name: "Tromsø", timeZone: 2),
City(name: "Dakar", timeZone: 0),
City(name: "All", timeZone: 0)
]


