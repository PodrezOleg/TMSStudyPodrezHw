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
    
    
    func updateBadgeCount() {
        
        let events = StorageManager.shared.loadEvents()
        let eventCount = events.count
        
        UNUserNotificationCenter.current().setBadgeCount(eventCount) { error in
            if let error = error {
                print("Ошибка при обновлении badge: \(error)")
            } else {
                print("Badge обновлен до: \(eventCount)")
            }
        }
    }
    
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Разрешение на уведомления получено")
            } else {
                print("Разрешение на уведомления не получено")
            }
            if let error = error {
                print("Ошибка при запросе разрешения: \(error)")
            }
        }
    }
    func scheduleNotification(for event: Event) {
        let center = UNUserNotificationCenter.current()
        
        center.getPendingNotificationRequests { requests in
            let pendingNotificationCount = requests.count + 1
            
            let content1day = UNMutableNotificationContent()
            content1day.title = event.title
            content1day.body = "Напоминание: \(event.title) завтра"
            content1day.sound = .default
            content1day.badge = NSNumber(value: pendingNotificationCount)
            
            
            let oneDayBefore = event.date.addingTimeInterval(-60 * 60 * 24)
            let triggerDate1 = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: oneDayBefore)
            let trigger1 = UNCalendarNotificationTrigger(dateMatching: triggerDate1, repeats: false)
            
            let request1 = UNNotificationRequest(
                identifier: "\(event.title)-1dayBefore",
                content: content1day,
                trigger: trigger1
            )
            center.add(request1) { error in
                if let error = error {
                    print("Ошибка при добавлении уведомления за 1 день: \(error)")
                } else {
                    print("Уведомление за 1 день успешно добавлено")
                }
            }
            
            let content = UNMutableNotificationContent()
            content.title = event.title
            content.body = "Событие: \(event.title) начинается сейчас"
            content.sound = .default
            content.badge = NSNumber(value: pendingNotificationCount + 1)
            
            
            let triggerDate2 = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: event.date)
            let trigger2 = UNCalendarNotificationTrigger(dateMatching: triggerDate2, repeats: false)
            
            let request2 = UNNotificationRequest(identifier: "\(event.title)-onTime", content: content, trigger: trigger2)
            center.add(request2)
        }
    }

}
