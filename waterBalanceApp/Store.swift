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
    @Published var dailyIntake: String = ""
    @Published var currentIntake: String = ""
    @Published var remindPeriod: RemindPeriod? = nil
    @Published var history: [ResultForDay] = []
    
    var showMainApp: Bool {
        if (goal == nil || dailyIntake == "" || remindPeriod == nil) {
            return false
        }
        
        return true
    }
    
    var progressPercent: String {
        let val = (currentIntakeDouble / dailyIntakeDouble) * 100
        return String(format: "%.0f", val)
    }
    
    var currentIntakeDouble: Double {
        guard let currentIntakeDouble = Double(currentIntake) else {
            return 0.00
        }
        return currentIntakeDouble
    }
    
    var dailyIntakeDouble: Double {
        guard let dailyIntakeDouble = Double(dailyIntake) else {
            return 0.00
        }
        return dailyIntakeDouble
    }
    
    func incrementCurrIntake(currIntakeStr: String) {
        guard let currIntake = Double(currIntakeStr) else {
            return
        }
        
        currentIntake = String(currentIntakeDouble + currIntake)
        self.cancelNotifications()
        
        if history.count == 0 {
            return
        }
        
        let waterIntake = WaterIntake(intake: currIntakeStr, time: getTodaysTime())
        history[history.count - 1].waterIntakes.append(waterIntake)
    }
    
    func cancelNotifications() {
        if currentIntakeDouble >= dailyIntakeDouble {
            cancelNotification()
        }
    }
    
    func onStart() {
        requestUserPermission()
        loadDataFromUserDefaults()
        
        let todaysDate = getTodaysDate()
        if history.count == 0 {
            createNewResultForDay(todaysDate: todaysDate)
            return
        }
        
        let lastResultForDay = history[history.count - 1]
        if lastResultForDay.date == todaysDate {
            return
        }
        
        createNewResultForDay(todaysDate: todaysDate)
    }
    
    func createNewResultForDay(todaysDate: String) {
        history.append(ResultForDay(date: todaysDate, waterIntakes: []))
    }
    
    func loadDataFromUserDefaults() {
        do {
            let data = try getFromUserDefaults()
            goal = data.goal
            dailyIntake = data.dailyIntake
            remindPeriod = data.remindPeriod
            history = data.history
            
            let todaysResult = data.history.first { resultForDay in
                resultForDay.date == getTodaysDate()
            }
            
            let currentIntakeInt = todaysResult?.waterIntakes.reduce(0) {
                guard let intake = Int($1.intake) else {
                    return 0
                }
                
                guard let accumulator = $0 else {
                    return 0
                }
                
                return accumulator + intake
            }
            
            guard let currentIntakeInt = currentIntakeInt else {
                return
            }
            
            currentIntake = String(currentIntakeInt)
        } catch {
            print(error)
        }
    }
    
    func loadDataToUserDefaults() {
        saveToUserDefaults(dataStorage: DataStorage(goal: goal, dailyIntake: dailyIntake, remindPeriod: remindPeriod, history: history))
    }
    
    func onRemindPeriodChange() {
        guard let remindPeriod = remindPeriod else {
            return
        }
        
        setNotification(remindPeriod: remindPeriod)
    }
    

    // Listen when an app is closed and save the data to UserDefaults
    private var observers = [NSObjectProtocol]()
    
    init() {
        observers.append(
            NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: .main) { _ in
                self.loadDataToUserDefaults()
            }
        )
    }
    
    deinit {
        observers.forEach(NotificationCenter.default.removeObserver)
    }
}
