//
//  MedRepository.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-15.
//

import Foundation
import MongoSwiftSync



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
        defer {
            // free driver resources
            cleanupMongoSwift()
        }

        let client = try MongoClient("mongodb+srv://user:user@medscanner.92fct.mongodb.net")

        let db = client.db("MEDS")
        let collection = db.collection("DOPING_MEDS", options: nil)

        let query: BSONDocument = ["a": 1]
        // The `sort` option specifies the order in which results are returned
        // via the cursor. In this case, `["_id": -1]` indicates that the documents will
        // be returned in descending order according to the `_id` field.
        let options = FindOptions(sort: ["_id": -1])
        let result = try collection.find(query, options: options).compactMap { cursor in
            dump(cursor)
        }

    }
}

