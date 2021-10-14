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
                    NavigationLink(destination: PostDetailsView()) {
                        PostView(with: childVM)

                }
            }
            .navigationTitle(Constants.Strings.Titles.postList)
        }
    }
}

struct PostDetailsView: View {
    var body: some View {
        Text("Post Details")
    }
}

struct PostView: View {
    @ObservedObject var viewModel: PostViewModel

    init(with viewModel: PostViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(Font.system(size: 24, weight: .heavy, design: .serif))
                .multilineTextAlignment(.leading)
            Text(viewModel.body)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
