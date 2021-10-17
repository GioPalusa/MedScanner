//
//  DopingMed.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-17.
//

import Foundation

// MARK: - DopingMed
struct DopingMed: Codable {
    let title: String
    let properties: Properties
}

// MARK: - Properties
struct Properties: Codable {
    let id, propertiesID, name: ID

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case propertiesID = "id"
        case name
    }
}

// MARK: - ID
struct ID: Codable {
    let bsonType: String
}
