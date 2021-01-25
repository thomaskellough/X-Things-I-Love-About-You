//
//  NotificationManager.swift
//  X-Things-I-Love-About-You
//
//  Created by Thomas Kellough on 1/24/21.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    // This will be the function we call in order to register local notifications for the user
    func registerLocal() {
        let center = UNUserNotificationCenter.current()
        
        // If we are at the end of the list, stop scheduling notifications
        let maxDay = UserDefaults.standard.integer(forKey: "maxDay")
        let totalCompliments = AllCompliments().compliments.count - 1

        // If we are at the maximum number of compliments, stop sending notifications!
        if maxDay == totalCompliments {
            center.removeAllPendingNotificationRequests()
            return
        }
        
        // If we made it here then we still have more compliments to go. Ask the user for permission and if they grant, schedule the notifications.
        center.requestAuthorization(options: [.alert, .badge, .sound]) {
            granted, error in
            if granted {
                self.scheduleLocal()
            } else {
                print("User denied permission!")
            }
        }
        
        registerCateories()
    }
    
    // This function is what shows then the user gets the notification and swipes down.
    func registerCateories() {
        let center = UNUserNotificationCenter.current()

        let show = UNNotificationAction(identifier: "show", title: "Okay, tell me!", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [], options: [])
        center.setNotificationCategories([category])
    }
    
    // This is what the notification will say to the user
    func scheduleLocal() {
        registerCateories()
        let center = UNUserNotificationCenter.current()
        // It's a good idea to remove any pending notifications before we schedule more.
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "I love you!"
        content.body = "Come see the next thing I love about you!"
        content.categoryIdentifier = "alarm"
        content.sound = .default
        
        // When do you want to show it. This will notify the user at 8:00 am every morning.
        var dateComponents = DateComponents()
        dateComponents.hour = 8
        dateComponents.minute = 0
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let requests = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(requests)
    }
}
