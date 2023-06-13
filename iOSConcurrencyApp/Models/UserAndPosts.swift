//
//  UserAndPosts.swift
//  iOSConcurrencyApp
//
//  Created by YILDIRIM on 13.06.2023.
//

import Foundation
struct UserAndPosts: Identifiable {
    var id = UUID()
    let user: User
    let posts: [Post]
    var numberOfPosts: Int { posts.count }
}
