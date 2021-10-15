//
//  HTTPTask.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-15.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias HTTPQueryItems = [String: String]
public typealias HTTPJsonBody = [String: Any]

public struct HTTPTask {
    var queryItems: HTTPQueryItems?
    var parameterKey: String?
    var httpBody: Data?
    var headers: [String: String]?

    init(queryItems: HTTPQueryItems? = nil, httpBody: Data? = nil, headers: [String: String]? = nil, parameterKey: String? = nil) {
        self.queryItems = queryItems
        self.httpBody = httpBody
        self.headers = headers
        self.parameterKey = parameterKey
    }
}
