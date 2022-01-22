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
