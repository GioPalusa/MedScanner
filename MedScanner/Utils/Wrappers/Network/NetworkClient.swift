//
//  NetworkClient.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-15.
//

import Foundation

class NetworkClient {
    private lazy var urlSession: URLSession = {
        var configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }()

    func perform<T: Codable>(endpoint: EndpointProtocol) async throws -> T {
        let request = endpoint.request()
        let response = try await urlSession.data(for: request)
        let result: Result<T, Error> = handleResponse(data: response.0, response: response.1)

        switch result {
        case .success(let object): return object
        case .failure(let error): throw error
        }
    }

    private func handleResponse<T: Codable>(data: Data, response: URLResponse) -> Result<T, Error> {
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(NetworkError.unknown)
        }

        guard 200..<400 ~= httpResponse.statusCode else {
            return .failure(NetworkError.serverError(statusCode: httpResponse.statusCode))
        }

        do {
            let response = try JSONDecoder().decode(T.self, from: data)
            return .success(response)
        } catch {
            return .failure(NetworkError.decodingError(error: error))
        }
    }

}
