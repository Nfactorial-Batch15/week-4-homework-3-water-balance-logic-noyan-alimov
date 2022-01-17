//
//  models.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 17/01/2022.
//

import Foundation
import SwiftUI

enum Goal: String, CaseIterable {
    case goalOne = "Goal Number One"
    case goalTwo = "Goal Number Two"
    case goalThree = "Goal Number Three"
    case goalFour = "Goal Number Four"
}

enum RemindPeriod: String {
    case fifteenMins = "15 minutes"
    case thirtyMins = "30 minutes"
    case fortyFiveMins = "45 minutes"
    case oneHour = "1 hour"
    case oneAndHalfHours = "1,5 hours"
    case twoHours = "2 hours"
    case threeHours = "3 hours"
    case fourHours = "4 hours"
}

struct ResultForDay {
    let date: String
    let waterIntakes: [WaterIntake]
}

struct WaterIntake {
    let intake: String
    let time: String
}

// data saved (persisted) in UserDefaults
struct DataStorage {
    let goal: Goal
    let dailyIntake: String
    let remindPeriod: RemindPeriod
    let history: [ResultForDay]
}


// UI related

struct MyColors {
    static var lightBlue = Color(red: 0.02, green: 0.647, blue: 0.937)
    static var lighterBlue = Color(red: 0.833, green: 0.882, blue: 0.972)
    static var blue = Color(red: 0.094, green: 0.408, blue: 0.992)
    static var black = Color(red: 0.184, green: 0.184, blue: 0.2)
    static var gray = Color(red: 0.235, green: 0.235, blue: 0.263)
}
