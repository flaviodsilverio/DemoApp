//
//  PostViewModel.swift
//  PostViewModel
//
//  Created by Flávio Silvério on 14/10/2021.
//

import Foundation

final class PostViewModel: ObservableObject, Identifiable {
    var id: String { post.id.description }

    lazy var body: String = {
        post.body
    }()

    lazy var title: String = {
        post.title
    }()

    let post: Post

    init(with post: Post) {
        self.post = post
    }
}
