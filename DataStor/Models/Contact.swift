//
//  Contact.swift
//  DataStor
//
//  Created by Alexander Shevtsov on 07.12.2024.
//

struct Contact: Codable {
    let firstName: String
    let lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
