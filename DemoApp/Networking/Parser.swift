//
//  Parser.swift
//  Parser
//
//  Created by Flávio Silvério on 14/10/2021.
//

import Foundation

enum ParserError: Error {
    case unknown
}

class Parser {
    func parse<T: Decodable>(_ data: Data, ofType type: T.Type) -> T? {
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            return object

        } catch {
            return nil
        }
    }
}
