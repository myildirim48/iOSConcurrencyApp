//
//  APIError.swift
//  iOSConcurrencyApp
//
//  Created by YILDIRIM on 12.06.2023.
//

import Foundation
enum APIError: Error {
    case invalidUrl
    case invalidResponseStatus
    case dataTaskError
    case corruptData
    case decodingError
}
