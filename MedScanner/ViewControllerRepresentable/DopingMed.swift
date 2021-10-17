//
//  DopingMed.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-17.
//

import Foundation

struct DopingMed: Codable {
    let meds: [Med]
}

struct Med: Codable, Identifiable, Hashable {
    let id = UUID()
    let substanceName, medName: String
    let description: String = """
Alvedon innehåller paracetamol som är
smärtlindrande oh febernedsättande.

Alvedon används för behandling av tillfälliga
feber- och smärttillständ av lindrig art, t ex feber
vid förkylning, huvudvärk, tandvärk,
menstruationssmärtor, muskel- och ledvärk.

Alvedon kan användas av personer med känslig
mage eller magsär och personer med ökad
blödningsbenägenhet.
"""
    let amount: String = "500 mg"

    enum CodingKeys: String, CodingKey {
        case substanceName = "substance_name"
        case medName = "med_name"
    }
}

// MARK: - DopingMed
//struct DopingMed: Identifiable, Codable, Hashable {
//    let id = UUID()
//    let properties: Properties
//
//    enum CodingKeys: String, CodingKey {
//        case title
//        case properties
//    }
//}
//
//// MARK: - Properties
//struct Properties: Codable, Hashable {
//    let id, medName: ID
//    let substanceName: ID
//    let description: String = """
//Alvedon innehåller paracetamol som är
//smärtlindrande oh febernedsättande.
//
//Alvedon används för behandling av tillfälliga
//feber- och smärttillständ av lindrig art, t ex feber
//vid förkylning, huvudvärk, tandvärk,
//menstruationssmärtor, muskel- och ledvärk.
//
//Alvedon kan användas av personer med känslig
//mage eller magsär och personer med ökad
//blödningsbenägenhet.
//"""
//    let amount: String = "500 mg"
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case medName = "med_name"
//        case substanceName = "substance_name"
//    }
//}
//
//// MARK: - ID
//struct ID: Codable, Hashable {
//    let bsonType: String
//}
