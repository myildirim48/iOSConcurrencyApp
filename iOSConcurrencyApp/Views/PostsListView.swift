//
//  PostsListView.swift
//  iOSConcurrencyApp
//
//  Created by YILDIRIM on 12.06.2023.
//

import SwiftUI

struct PostsListView: View {
    @StateObject var viewModel = PostsListViewModel(forPreview: true)
    var userId: Int?
    var body: some View {
            List {
                ForEach(viewModel.posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.title)
                        Text(post.body)
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .overlay(content: {
                if viewModel.isLoading {
                    ProgressView()
                }
            })
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .onAppear {
                viewModel.userId = userId
                viewModel.fetchPosts()
            }
        }
    
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostsListView(userId: 1)
        }
    }
}
