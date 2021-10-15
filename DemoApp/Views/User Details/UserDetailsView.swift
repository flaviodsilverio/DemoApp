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
            Section(header: Text(Strings.Titles.personalDetails)) {
                UserDetailSimpleComponentView(
                    label: Strings.Titles.name,
                    value: viewModel.name)

                UserDetailSimpleComponentView(
                    label: Strings.Titles.username,
                    value: viewModel.username)

                UserDetailEmailComponentView(
                    label: Strings.Titles.email,
                    value: viewModel.email)

                UserDetailPhoneView(
                    label: Strings.Titles.phone,
                    value: viewModel.phone)

                UserDetailSimpleComponentView(
                    label: Strings.Titles.website,
                    value: viewModel.website)
            }

            Section(header: Text(Strings.Titles.address)) {
                UserDetailSimpleComponentView(
                    label: Strings.Titles.address,
                    value: viewModel.address)

                UserDetailSimpleComponentView(
                    label: Strings.Titles.postcode,
                    value: viewModel.postcode)

                MapView(currentLocation: CurrentLocation(coordinate: CLLocationCoordinate2D(
                    latitude: viewModel.latitude,
                    longitude: viewModel.longitude)),
                        region:viewModel.region)
            }

            Section(header: Text(Strings.Titles.employment)) {
                UserDetailSimpleComponentView(
                    label: Strings.Titles.employer,
                    value: viewModel.company)

                UserDetailSimpleComponentView(
                    label: Strings.Titles.jobDescription,
                    value: viewModel.jobTitle)
            }

        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Strings.Titles.userDetails)
    }
}

