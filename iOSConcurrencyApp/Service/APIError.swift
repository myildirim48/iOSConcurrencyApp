//
//  APIError.swift
//  iOSConcurrencyApp
//
//  Created by YILDIRIM on 12.06.2023.
//

import Foundation
enum APIError: Error, LocalizedError {
    case invalidUrl
    case invalidResponseStatus
    case dataTaskError(String)
    case corruptData
    case decodingError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return NSLocalizedString("The endpoint URL is invalid.", comment: "")
        case .invalidResponseStatus:
            return NSLocalizedString("The API failed to issue a valid response.", comment: "")
        case .dataTaskError(let string):
            return string
        case .corruptData:
            return NSLocalizedString("The data provied appears to be corrupt.", comment: "")
        case .decodingError(let string):
            return string
        }
    }
}
