//
//  CityView.swift
//  PodrezHw24
//
//  Created by Oleg Podrez on 10.09.24.
//

import Foundation

struct City {
    let name: String
    let timeZone: String
    
    
    func showCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: timeZone)
        return formatter.string(from: Date())
    }
    func currentHour() -> Int? {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        formatter.timeZone = TimeZone(identifier: timeZone)
        return Int(formatter.string(from: Date()))
    }
    
    func isDaytime() -> Bool  {
        guard let hour = currentHour() else { return false }
        return hour >= 6 && hour < 18
    }
}
      
    
     let cities = [
        City(name: "Tokyo", timeZone: "Asia/Tokyo"),
        City(name: "Sydney", timeZone: "Australia/Sydney"),
        City(name: "Dallas", timeZone: "America/Chicago"),
        City(name: "Cape Town", timeZone: "Africa/Johannesburg"),
        City(name: "Santiago", timeZone: "America/Santiago"),
        City(name: "Tromsø", timeZone: "Europe/Oslo"),
        City(name: "Dakar", timeZone: "Africa/Dakar"),
        City(name: "All", timeZone: "")
    ]




