//
//  CommentDetailView.swift
//  CommentDetailView
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
import SwiftUI

struct CommentDetailView: View {
    var email: String
    var text: String

    var body: some View {
        VStack {
            HStack {
                Button(email) {
                    MailComposeViewController.shared.sendEmail(to: email)
                }
                .font(.title)
                Spacer()
            }
            HStack {
                Text(text).font(.body)
                Spacer()
            }
        }
    }
}
