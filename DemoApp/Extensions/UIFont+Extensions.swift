//
//  UIFont+Extensions.swift
//  UIFont+Extensions
//
//  Created by Flávio Silvério on 14/10/2021.
//

import Foundation
import SwiftUI

extension Font {
    static var title: Font {
        Font.system(size: 16,
                    weight: .regular,
                    design: .rounded)
    }

    static var body: Font {
        Font.system(size: 12,
                    weight: .light,
                    design: .default)
    }
}
