//
//  UserDetailPhoneView.swift
//  UserDetailPhoneView
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
import SwiftUI

struct UserDetailPhoneView: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text(label).font(.body)
            Spacer()
            Button(String.numericString(from: value)) {
                let numericString = String.numericString(from:  value)
                guard let url = URL(string: "tel://" + numericString) else { return }
                UIApplication.shared.open(url)
            }
        }
    }
}
