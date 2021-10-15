//
//  UserDetailsView.swift
//  UserDetailsView
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
import SwiftUI
import MapKit

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
        .navigationTitle(Strings.Titles.userDetails)
    }
}

