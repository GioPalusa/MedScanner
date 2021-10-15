//
//  NetworkError.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-15.
//

import Foundation

enum NetworkError: Error {
    case serverError(statusCode: Int)
    case decodingError(error: Error)
    case unknown
}
