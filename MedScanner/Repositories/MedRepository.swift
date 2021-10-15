//
//  MedRepository.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-15.
//

import Foundation

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
}
