//
//  Notification.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 23/01/2022.
//

import Foundation
import UserNotifications

func requestUserPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if success {
            print("All set!")
        } else if let error = error {
            print(error.localizedDescription)
        }
    }
}

func setNotification(remindPeriod: RemindPeriod) {
    let content = UNMutableNotificationContent()
    content.title = "Time to drink water!"
    content.subtitle = "Friendly reminder to continue to drink water, it's healthy 😄"
    content.sound = UNNotificationSound.default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(convertRemindPeriodToSeconds(remindPeriod: remindPeriod)), repeats: true)
    let request = UNNotificationRequest(identifier: "drinkWaterReminder", content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request)
}

func cancelNotification() {
    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["drinkWaterReminder"])
}
