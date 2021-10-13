//
//  Post.swift
//  Post
//
//  Created by Flávio Silvério on 13/10/2021.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
