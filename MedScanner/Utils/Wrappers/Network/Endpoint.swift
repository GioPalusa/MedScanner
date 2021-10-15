//
//  Endpoint.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-15.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

enum Endpoint: EndpointProtocol {
    case test // TODO: Remove later

    var baseURL: URL { URL(string: "")! }

    var path: String { "" }

    var httpMethod: HTTPMethod { .get }

    var task: HTTPTask { .init() }

    var headers: HTTPHeaders? { nil }

}

extension EndpointProtocol {
    func request() -> URLRequest {
        var components: URLComponents?
        if path.isEmpty {
            components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        } else {
            components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)
        }
        let queryItemsFromUrl = components?.queryItems ?? []
        let queryItemsFromTask = (task.queryItems?.map({ URLQueryItem(name: $0, value: $1) }) ?? [])
        if !(queryItemsFromUrl + queryItemsFromTask).isEmpty {
            components?.queryItems = queryItemsFromUrl + queryItemsFromTask
        }
        guard let url = components?.url else { assert(false, "Could not create url"); fatalError() }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue

        if let body = task.httpBody {
            let data = body
            request.httpBody = data
        }

        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = headers
        return request
    }
}
