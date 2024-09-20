//
//  CityView.swift
//  PodrezHw24
//
//  Created by Oleg Podrez on 10.09.24.
//

import Foundation

class City {
    let name: String
    let timeZone: String
    
    init(name: String, timeZone: String) {
        self.name = name
        self.timeZone = timeZone
    }
    func showCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
//        formatter.timeZone = TimeZone(identifier: timeZone)
        
        if let cityTimeZone = TimeZone(identifier: timeZone) {
            formatter.timeZone = cityTimeZone
        } else {
            formatter.timeZone = TimeZone.current 
        }
        
        let currentTime = formatter.string(from: Date())
        return currentTime
    }
    
    static let cityList: [City] = [
        City(name: "Tokyo", timeZone: "Asia/Tokyo"),
        City(name: "Sydney", timeZone: "Australia/Sydney"),
        City(name: "Dallas", timeZone: "America/Chicago"),
        City(name: "Cape Town", timeZone: "Africa/Johannesburg"),
        City(name: "Santiago", timeZone: "America/Santiago"),
        City(name: "Tromsø", timeZone: "Europe/Oslo"),
        City(name: "Dakar", timeZone: "Africa/Dakar"),
        City(name: "All", timeZone: "")
    ]
    
}



