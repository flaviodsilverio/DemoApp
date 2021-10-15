//
//  PostDetailsViewModel.swift
//  PostDetailsViewModel
//
//  Created by Flávio Silvério on 14/10/2021.
//

import Foundation

final class PostDetailsViewModel: ObservableObject {
    let userRequestClient: RequestClient<User>
    let commentsRequestClient: RequestClient<[Comment]>

    @Published var commentsViewModels: [CommentViewModel] = []
    @Published var userViewModel: UserViewModel = UserViewModel()

    lazy var title: String = {
        post.title
    }()

    lazy var body: String = {
        post.body
    }()

    private let post: Post

    init(with post: Post,
         userRequestClient
         userRequest: RequestClient<User> = RequestClient(with: User.requestParam),
         commentsRequestClient
         commentRequest: RequestClient<[Comment]> = RequestClient(with: Comment.requestParam)) {
        
        self.post = post
        self.commentsRequestClient = commentRequest
        self.userRequestClient = userRequest

        getPostComments()
        getPostUser()
    }

    func getPostComments() {
        commentsRequestClient.fetchItem(
            with: Strings.API.postIDPostfix + post.id.description
        ) {
            result in
            switch result {
            case .success(let comments):
                self.commentsViewModels = comments.map {
                    CommentViewModel(with: $0)
                }

            case .failure(let error):
                print(error)
            }
        }
    }

    func getPostUser() {
        userRequestClient.fetchItem(with: post.userId.description) { result in
            switch result {
            case .success(let user):
                self.userViewModel.setUser(user)
            case .failure(let error):
                print(error)
            }
        }
    }
}

class CommentViewModel: ObservableObject, Identifiable {
    var id: String { comment.id.description }
    
    private let comment: Comment

    lazy var email: String = {
        comment.email
    }()

    lazy var text: String = {
        comment.body
    }()

    init(with comment: Comment) {
        self.comment = comment
    }
}

