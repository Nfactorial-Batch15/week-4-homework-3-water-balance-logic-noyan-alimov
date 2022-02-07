//
//  DataStorage.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 23/01/2022.
//

import Foundation

func saveToUserDefaults(dataStorage: DataStorage) {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(dataStorage) {
        UserDefaults.standard.set(encoded, forKey: "DataStorage")
    }
}

func getFromUserDefaults() throws -> DataStorage {
    if let dataStorage = UserDefaults.standard.object(forKey: "DataStorage") as? Data {
        let decoder = JSONDecoder()
        if let loadedData = try? decoder.decode(DataStorage.self, from: dataStorage) {
            return loadedData
        }
        
        throw DataStorageError.errorGettingDataFromUserDefaults
    }
    
    throw DataStorageError.errorGettingDataFromUserDefaults
}
