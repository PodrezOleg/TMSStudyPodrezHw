//
//  Notifications.swift
//  PodrezHW33
//
//  Created by Oleg Podrez on 30.10.24.
//

import UserNotifications

class Notifications {
    static let shared = Notifications()
    
    private init() {}
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            
            if granted {
                print ("Разрешение получено")
            } else {
                print ("Разрешение не получено")
            }
        }
    }
    
    func scheduleNotification(for event: Event){
        let content = UNMutableNotificationContent()
        content.title = event.title
        content.body = event.date.description
        content.sound = .default
        
        
        let notificationDate = event.date.addingTimeInterval(10)
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: notificationDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let request = UNNotificationRequest(identifier: event.title, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Ошибка: \(error)")
            }
        }
    }
}
