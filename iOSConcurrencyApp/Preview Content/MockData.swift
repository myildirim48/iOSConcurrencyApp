//
//  MockData.swift
//  iOSConcurrencyApp
//
//  Created by YILDIRIM on 12.06.2023.
//

import Foundation
extension User {
    static var mockUsers: [User] {
        Bundle.main.decode([User].self, from: "Users.json")
    }
    static var mockSingleUser: User {
        Self.mockUsers[0]
    }
}

extension Post {
    static var mockPost: [Post] {
        Bundle.main.decode([Post].self, from: "Posts.json")
    }
    static var mockSinglePost: Post {
        Self.mockPost[0]
    }
    
    static var mockSingleUsersPostArray: [Post] {
        Self.mockPost.filter { $0.userId == 1 }
    }
}

extension UserAndPosts {
    static var mockUserAndPosts: [UserAndPosts] {
        var newUsersAndPosts: [UserAndPosts] = []
        for user in User.mockUsers {
            let newUserAndPosts = UserAndPosts(user: user, posts: Post.mockPost.filter { $0.userId == user.id })
            newUsersAndPosts.append(newUserAndPosts)
        }
        return newUsersAndPosts
    }

}
