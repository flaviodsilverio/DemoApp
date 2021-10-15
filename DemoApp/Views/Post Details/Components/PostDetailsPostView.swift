//
//  PostDetailsPostView.swift
//  PostDetailsPostView
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
import SwiftUI

struct PostDetailsPostView: View {
    @ObservedObject var viewModel: PostDetailsViewModel
    @State private var showShareSheet: Bool = false
    @State var shareSheetItems: [Any] = [Strings.Titles.shareSheetTitle]

    init(with viewModel: PostDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width:20)
                Text(viewModel.title).font(.title)
                Spacer().frame(width:20)
            }

            Text(viewModel.body).font(.body)
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.showShareSheet.toggle()
                }) {
                    Image(systemName: Strings.ImageNames.shareButton)
                }.sheet(isPresented: $showShareSheet, content: {
                    ActivityViewController(activityItems: self.$shareSheetItems)
                })
            }
        }
    }

}
