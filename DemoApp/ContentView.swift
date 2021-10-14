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

struct PostListItemView: View {
    @ObservedObject var viewModel: PostViewModel

    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.title)
        }
    }
}

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
        .navigationTitle("Post Details")
    }
}

struct PostDetailsPostView: View {
    @ObservedObject var viewModel: PostDetailsViewModel

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
        }
    }

}

struct PostDetailsAuthorView: View {
    @ObservedObject var viewModel: UserViewModel

    var body: some View {
        NavigationLink(destination: UserDetailsView(viewModel: viewModel)) {
            Text(viewModel.authorDescription).font(.title)
        }
    }
}

struct PostDetailsCommentsView: View {
    @ObservedObject var viewModel: PostDetailsViewModel

    var body: some View {
        VStack {
            Text("All Comments")
                .font(.title)
            List(viewModel.commentsViewModels) { viewModel in
                CommentDetailView(email: viewModel.email,
                                  text: viewModel.text)
            }
        }
    }
}

struct CommentDetailView: View {
    var email: String
    var text: String

    var body: some View {
        VStack {
            HStack {
                Text(email).font(.title)
                Spacer()
            }
            HStack {
                Text(text).font(.body)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}

struct UserDetailsView: View {
    var viewModel: UserViewModel

    var body: some View {
        List {
            Section(header: Text("Personal Details")) {
                UserDetailComponentView(label: "Name", value: viewModel.name)
                UserDetailComponentView(label: "Username", value: viewModel.username)
                UserDetailComponentView(label: "Email", value: viewModel.email)
                UserDetailComponentView(label: "Phone", value: viewModel.phone)
                UserDetailComponentView(label: "Website", value: viewModel.website)
            }

            Section(header: Text("Address")) {
                UserDetailComponentView(label: "Address", value: viewModel.address)
                UserDetailComponentView(label: "Postcode", value: viewModel.postcode)
                MapView(currentLocation: CurrentLocation(coordinate: CLLocationCoordinate2D(
                    latitude: viewModel.latitude,
                    longitude: viewModel.longitude)), region:viewModel.region)
            }

            Section(header: Text("Employment")) {
                UserDetailComponentView(label: "Employer", value: viewModel.company)
                UserDetailComponentView(label: "Job Title", value: viewModel.jobTitle)
            }

        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("User Details")
    }
}

struct UserDetailComponentView: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text(label).font(.body)
            Spacer()
            Text(value).font(.body)
        }
    }
}

import MapKit

struct CurrentLocation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State var currentLocation: CurrentLocation

    @State var region: MKCoordinateRegion

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [currentLocation]) {
            MapMarker(coordinate: $0.coordinate)
        }
        .frame(height: 200)
    }
}
