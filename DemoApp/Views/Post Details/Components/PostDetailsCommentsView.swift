//
//  PostDetailsCommentsView.swift
//  PostDetailsCommentsView
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
import SwiftUI

struct PostDetailsCommentsView: View {
    @ObservedObject var viewModel: PostDetailsViewModel

    var body: some View {
        VStack {
            Text(Strings.Titles.allComments)
                .font(.title)
            List(viewModel.commentsViewModels) { viewModel in
                CommentDetailView(email: viewModel.email,
                                  text: viewModel.text)
            }
        }
    }
}
