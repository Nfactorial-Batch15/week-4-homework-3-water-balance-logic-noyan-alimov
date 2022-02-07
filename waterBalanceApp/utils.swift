//
//  utils.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 23/01/2022.
//

import Foundation

func getTodaysTime() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:MM"

    return dateFormatter.string(from: date)
}

func getTodaysDate() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.YY"

    return dateFormatter.string(from: date)
}

func convertRemindPeriodToSeconds(remindPeriod: RemindPeriod) -> Int {
    switch remindPeriod {
    case .fifteenMins:
        return 5
//        return 900
    case .thirtyMins:
        return 1800
    case .fortyFiveMins:
        return 2700
    case .oneHour:
        return 3600
    case .oneAndHalfHours:
        return 5400
    case .twoHours:
        return 7200
    case .threeHours:
        return 10800
    case .fourHours:
        return 14400
    }
}
