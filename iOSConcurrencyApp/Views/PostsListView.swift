//
//  PostsListView.swift
//  iOSConcurrencyApp
//
//  Created by YILDIRIM on 12.06.2023.
//

import SwiftUI

struct PostsListView: View {
    var posts: [Post]
    var body: some View {
            List {
                ForEach(posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.title)
                        Text(post.body)
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)

        }
    
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostsListView(posts: Post.mockSingleUsersPostArray)
        }
    }
}
