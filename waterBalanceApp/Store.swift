//
//  store.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 17/01/2022.
//

import Foundation
import SwiftUI

class Store: ObservableObject {
    @Published var goal: Goal? = nil
    @Published var dailyIntake: Float = 0.0
    @Published var currentIntake: Float = 0.0
    @Published var remindPeriod: RemindPeriod? = nil
    @Published var history: [ResultForDay] = []
    
    var showMainApp: Bool {
        if (goal == nil && dailyIntake == 0.0 && remindPeriod == nil) {
            return false
        }
        
        return true
    }
    
    var progressPercent: Float {
        roundf((currentIntake / dailyIntake) * 100)
    }
}

//@propertyWrapper
//struct AppDataStorage<T: Codable> {
//    private let key: String
//    private let defaultValue: T
//
//    init(key: String, defaultValue: T) {
//        self.key = key
//        self.defaultValue = defaultValue
//    }
//
//    var wrappedValue: T {
//        get {
//            guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
//                return defaultValue
//            }
//            let value = try? JSONDecoder().decode(T.self, from: data)
//            return value ?? defaultValue
//        }
//        set {
//            let data = try? JSONEncoder().encode(newValue)
//            UserDefaults.standard.set(data, forKey: key)
//        }
//    }
//}