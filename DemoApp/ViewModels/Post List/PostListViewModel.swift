//
//  PostListViewModel.swift
//  PostListViewModel
//
//  Created by Flávio Silvério on 14/10/2021.
//

import Foundation

final class PostListViewModel: ObservableObject {
    let requestClient: RequestClient<[Post]>

    @Published var childViewModels: [PostViewModel] = []

    init(_ requestClient: RequestClient<[Post]> = RequestClient(with: Post.requestParam)) {

        self.requestClient = requestClient

        getData()
    }

    func getData() {
        requestClient.fetchAll() { result in
            switch result {
            case .success(let posts):
                self.createChildViewModels(from: posts)
                
            case .failure(_):
                break
            }
        }
    }

    private func createChildViewModels(from posts: [Post]) {
        DispatchQueue.main.async {
            self.childViewModels = posts.map {
                PostViewModel(with: $0)
            }
        }

    }
}

struct UserListItemViewModel {
    let requestClient: RequestClient<[User]>

    init(_ requestClient: RequestClient<[User]> = RequestClient(with: User.requestParam)) {

        self.requestClient = requestClient

        getData()
    }

    func getData() {
        requestClient.fetchAll() { result in
            switch result {
            case .success(let users):
                print(users)
            case .failure(_):
                break
            }
        }
    }
}
