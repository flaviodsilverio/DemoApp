//
//  UserDetailEmailComponentView.swift
//  UserDetailEmailComponentView
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
import SwiftUI

struct UserDetailEmailComponentView: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text(label).font(.body)
            Spacer()
            Button(value) {
                MailComposeViewController.shared.sendEmail(to: value)
            }
        }
    }
}

