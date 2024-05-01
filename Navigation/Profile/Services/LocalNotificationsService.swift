//
//  LocalNotificationsService.swift
//  Navigation
//
//  Created by Apple Mac Air on 22.04.2024.
//

import Foundation
import UserNotifications

class LocalNotificationsService {
    
    func registeForLatestUpdatesIfPossible() {
        
        registerUpdatesCategory()
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                let content = UNMutableNotificationContent()
                content.body = "Посмотрите последние обновления"
                content.sound = .default
                content.categoryIdentifier = "updates"
                
                var dateComponents = DateComponents()
                dateComponents.hour = 19
                dateComponents.minute = 00
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                center.add(request)
            }
        }
    }
    
    func registerUpdatesCategory() {
        
        let action = UNNotificationAction(identifier: "action", title: "Посмотреть")
        let category = UNNotificationCategory(identifier: "updates", actions: [action], intentIdentifiers: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
}

