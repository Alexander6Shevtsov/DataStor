//
//  StorageManager.swift
//  DataStor
//
//  Created by Alexander Shevtsov on 08.12.2024.
//

import Foundation
// синглтон
final class StorageManager {
    static let shared = StorageManager()
    
    private let fileURL = URL.documentsDirectory.appending(path: "Contacts").appendingPathExtension("plist")
    
    private init() {
        print(fileURL)
    }
    
    func fetchContacts() -> [Contact] {
        guard let data = try? Data(contentsOf: fileURL) else { return [] }
        guard let contacts = try? PropertyListDecoder().decode([Contact].self, from: data) else { return [] }
        return contacts
    }
    
    func save(contact: Contact) {
        var contacts = fetchContacts()
        contacts.append(contact)
        // сохранение в массиве
        guard let data = try? PropertyListEncoder().encode(contacts) else { return }
        try? data.write(to: fileURL, options: .noFileProtection)
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        // сохранение изменения
        guard let data = try? PropertyListEncoder().encode(contacts) else { return }
        try? data.write(to: fileURL, options: .noFileProtection)
    }
}
