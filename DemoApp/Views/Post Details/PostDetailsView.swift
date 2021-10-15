//
//  PostDetailsView.swift
//  PostDetailsView
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
import SwiftUI

struct PostDetailsView: View {
    @ObservedObject var viewModel: PostDetailsViewModel

    init(with viewModel: PostDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            PostDetailsPostView(with: viewModel)
            Spacer().frame(height: 20)
            PostDetailsAuthorView(viewModel: viewModel.userViewModel)
            Spacer().frame(height: 40)
            PostDetailsCommentsView(viewModel: viewModel)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Strings.Titles.postDetails)
    }
}
