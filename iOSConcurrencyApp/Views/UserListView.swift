//
//  UserListView.swift
//  iOSConcurrencyApp
//
//  Created by YILDIRIM on 12.06.2023.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel(forPreview: false)
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.usersAndPosts) { usersAndPosts in
                    NavigationLink {
                        PostsListView(posts: usersAndPosts.posts)
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(usersAndPosts.user.name)
                                    .font(.title)
                                Spacer()
                                Text("\(usersAndPosts.numberOfPosts)")
                            }
                            Text(usersAndPosts.user.email)
                                .font(.callout)
                        }
                    }
                }
            }
            .overlay(content: {
                if viewModel.isLoading {
                    ProgressView()
                }
            })
            .alert("Application Error", isPresented: $viewModel.showError, actions: {
                Button("OK") { }
            }, message: {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                }
            })
            .navigationTitle("Users")
            .listStyle(.plain)
            .task {
                await viewModel.fetchUsers()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
