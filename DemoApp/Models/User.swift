//
//  User.swift
//  User
//
//  Created by Flávio Silvério on 13/10/2021.
//

import Foundation

struct User: Decodable {
    let id: Int
    let username: String
    let name: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company

    struct Company: Decodable {
        let name: String
        let catchPhrase: String
        let bs: String
    }

    struct Address: Decodable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: Geo

        struct Geo: Decodable {
            let lat: String
            let lng: String
        }
    }
}

extension User: Requestable {
    static let requestParam: String = Strings.API.users
}
