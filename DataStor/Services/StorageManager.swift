//
//  StorageManager.swift
//  DataStor
//
//  Created by Alexander Shevtsov on 08.12.2024.
//

import Foundation

final class StorageManager {
    static let shared = StorageManager()
    
    private let fileURL = URL.documentsDirectory.appending(path: "Contacts").appendingPathExtension("plist")
    
    private init() {
        print(fileURL)
    }
}
