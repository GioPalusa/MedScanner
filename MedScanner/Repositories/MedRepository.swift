//
//  MedRepository.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-15.
//

import Foundation
import RealmSwift

let app = RealmSwift.Realm..App(id: "medscanner-howfu")

class MedRepository {
    private let networkClient = NetworkClient()


    // TODO: Fetch/Post data
    func fetchTest() async throws -> String {
        do {
            let model: String = try await networkClient.perform(endpoint: Endpoint.test)
            return model
        } catch {
            throw error
        }
    }
// MongoCollection<BSONDocument>
    func getDBCollection() async throws -> Void {

    }
}

