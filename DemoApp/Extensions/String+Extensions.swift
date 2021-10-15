//
//  String+Extensions.swift
//  String+Extensions
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation

extension String {
    static func numericString(from string: String) -> String {
        guard let number = Int(
            string.components(
                separatedBy:
                    CharacterSet.decimalDigits.inverted)
                .joined())
        else {
            return "0000000000"
        }
        
        return String(number)
    }

    static var empty: String {
        return ""
    }

    static var comma: String {
        return ", "
    }
}
