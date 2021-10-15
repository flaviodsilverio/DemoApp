//
//  PostListItemView.swift
//  PostListItemView
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
import SwiftUI

struct PostListItemView: View {
    @ObservedObject var viewModel: PostViewModel

    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.title)
        }
    }
}
