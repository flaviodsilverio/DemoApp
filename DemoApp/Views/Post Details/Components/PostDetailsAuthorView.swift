//
//  PostDetailsAuthorView.swift
//  PostDetailsAuthorView
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
import SwiftUI

struct PostDetailsAuthorView: View {
    @ObservedObject var viewModel: UserViewModel

    var body: some View {
        NavigationLink(destination: UserDetailsView(viewModel: viewModel)) {
            Text(viewModel.authorDescription).font(.title)
        }
    }
}
