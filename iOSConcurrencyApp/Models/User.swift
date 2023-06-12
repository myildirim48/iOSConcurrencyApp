//
//  User.swift
//  iOSConcurrencyApp
//
//  Created by YILDIRIM on 12.06.2023.
//

import Foundation
struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
