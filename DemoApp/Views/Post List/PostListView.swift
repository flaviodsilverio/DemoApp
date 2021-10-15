//
//  ContentView.swift
//  DemoApp
//
//  Created by Flávio Silvério on 13/10/2021.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var viewModel = PostListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.childViewModels) { childVM in
                NavigationLink(
                    destination: PostDetailsView(
                        with: PostDetailsViewModel(
                            with: childVM.post)
                    )
                ) {
                    PostListItemView(viewModel: childVM)
                }
            }
            .navigationTitle(Constants.Strings.Titles.postList)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
