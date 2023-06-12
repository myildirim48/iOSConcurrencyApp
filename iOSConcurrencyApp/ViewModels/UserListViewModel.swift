//
//  UserListViewModel.swift
//  iOSConcurrencyApp
//
//  Created by YILDIRIM on 12.06.2023.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var showError = false
    @Published var errorMessage: String?
    
    func fetchUsers() {
        let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users")
        isLoading.toggle()
        apiService.getJSON { (result: Result<[User], APIError>) in
            defer {
                DispatchQueue.main.async {
                    self.isLoading.toggle()
                }
                
            }
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                }
            case .failure(let failure):
                self.showError = true
                self.errorMessage = failure.localizedDescription + "\nPlease contact the developer and provide this error and the steps to reproduce."
            }
        }
    }
}

extension UserListViewModel {
    convenience init(forPreview: Bool = false) {
        self.init()
        
        if forPreview {
            self.users = User.mockUsers
        }
    }
}
