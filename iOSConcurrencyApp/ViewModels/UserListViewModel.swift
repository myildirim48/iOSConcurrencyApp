//
//  UserListViewModel.swift
//  iOSConcurrencyApp
//
//  Created by YILDIRIM on 12.06.2023.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var usersAndPosts: [UserAndPosts] = []
    @Published var isLoading = false
    @Published var showError = false
    @Published var errorMessage: String?
    
    @MainActor
    func fetchUsers() async {
        let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users")
        let apiService2 = APIService(urlString: "https://jsonplaceholder.typicode.com/posts")
        defer {
            isLoading.toggle()
        }
        do {
           async let users: [User] = try await apiService.getJSON()
            async let posts: [Post] = try await apiService2.getJSON()
            let (fetchedUsers, fetchedPosts) = await (try users, try posts)
            for user in fetchedUsers {
                let userPosts = fetchedPosts.filter { $0.userId == user.id }
                let newUserAndPosts = UserAndPosts(user: user, posts: userPosts)
                usersAndPosts.append(newUserAndPosts)
            }
        } catch {
            showError = true
            errorMessage = error.localizedDescription + "\nPlease contact the developer and provide this error and the steps to reproduce."
        }
        
    }
}

extension UserListViewModel {
    convenience init(forPreview: Bool = false) {
        self.init()

        if forPreview {
            self.usersAndPosts = UserAndPosts.mockUserAndPosts
        }
    }
}
