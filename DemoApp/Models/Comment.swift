//
//  Comment.swift
//  Comment
//
//  Created by Flávio Silvério on 13/10/2021.
//

import Foundation

struct Comment: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let body: String
    let email: String
}

extension Comment: Requestable {
    static let requestParam: String = Strings.API.comments
}
