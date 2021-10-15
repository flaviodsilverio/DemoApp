//
//  UserDetailSimpleComponentView.swift
//  UserDetailSimpleComponentView
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
import SwiftUI

struct UserDetailSimpleComponentView: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text(label).font(.body)
            Spacer()
            Text(value).font(.body)
        }
    }
}
