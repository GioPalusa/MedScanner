//
//  MedRepository.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-15.
//

import RealmSwift
import Foundation

let app = RealmSwift.App(id: "medscanner-howfu")

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
        app.login(credentials: Credentials.anonymous) { (result) in
            // Remember to dispatch back to the main thread in completion handlers
            // if you want to do anything on the UI.
            DispatchQueue.main.async {
                switch result {
                    case .failure(let error):
                        print("Login failed: \(error)")
                    case .success(let user):
                        print("Login as \(user) succeeded!")
                        // Continue below
                        self.onRealmOpened()
                }
            }
        }

    }

    private func openRealm() {
        let user = app.currentUser!
        // The partition determines which subset of data to access.
        let partitionValue = "DOPING_MEDS.DOPING_MEDS_AND_SUBSTANCE"
        // Get a sync configuration from the user object.
        var configuration = user.configuration(partitionValue: partitionValue)
        // Open the realm asynchronously to ensure backend data is downloaded first.
        Realm.asyncOpen(configuration: configuration) { (result) in
            switch result {
                case .failure(let error):
                    print("Failed to open realm: \(error.localizedDescription)")
                    // Handle error...
                case .success(let realm):
                    // Realm opened
                    break
                    // self.onRealmOpened(realm)
            }
        }


    }

    private func onRealmOpened() {
        let client = app.currentUser?.mongoClient("mongodb-atlas")
        let db = client?.database(named: "DOPING_MEDS")
        let collection = db?.collection(withName: "DOPING_MEDS_AND_SUBSTANCE")
        dump(collection?.find(filter: Document()))

    }
}

