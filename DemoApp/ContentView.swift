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
    @State private var showShareSheet: Bool = false
    @State var shareSheetItems: [Any] = ["Look at this awesome post!"]

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
                    Image(systemName: "square.and.arrow.up")
                }.sheet(isPresented: $showShareSheet, content: {
                    ActivityViewController(activityItems: self.$shareSheetItems)
                })
            }
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
                UserDetailSimpleComponentView(label: "Name", value: viewModel.name)
                UserDetailSimpleComponentView(label: "Username", value: viewModel.username)
                UserDetailEmailComponentView(label: "Email", value: viewModel.email)
                UserDetailPhoneView(label: "Phone", value: viewModel.phone)
                UserDetailSimpleComponentView(label: "Website", value: viewModel.website)
            }

            Section(header: Text("Address")) {
                UserDetailSimpleComponentView(label: "Address", value: viewModel.address)
                UserDetailSimpleComponentView(label: "Postcode", value: viewModel.postcode)
                MapView(currentLocation: CurrentLocation(coordinate: CLLocationCoordinate2D(
                    latitude: viewModel.latitude,
                    longitude: viewModel.longitude)), region:viewModel.region)
            }

            Section(header: Text("Employment")) {
                UserDetailSimpleComponentView(label: "Employer", value: viewModel.company)
                UserDetailSimpleComponentView(label: "Job Title", value: viewModel.jobTitle)
            }

        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("User Details")
    }
}

struct UserDetailSimpleComponentView: View {
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

struct UserDetailPhoneView: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text(label).font(.body)
            Spacer()
            Button(String.numericString(from: value)) {
                let numericString = String.numericString(from:  value)
                guard let url = URL(string: "tel://" + numericString) else { return }
                UIApplication.shared.open(url)
            }
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

import MessageUI

class MailComposeViewController: UIViewController, MFMailComposeViewControllerDelegate {

    static let shared = MailComposeViewController()

    func sendEmail(to recipient: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([recipient])
            mail.setMessageBody("<p>Hello!</p>", isHTML: true)
            UIApplication.shared.windows.first?.rootViewController?.present(mail, animated: true)
        } else {
            // show failure alert
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}


struct ActivityViewController: UIViewControllerRepresentable {

    @Binding var activityItems: [Any]
    var excludedActivityTypes: [UIActivity.ActivityType]? = nil

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems,
                                                  applicationActivities: nil)

        controller.excludedActivityTypes = excludedActivityTypes

        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}
}
