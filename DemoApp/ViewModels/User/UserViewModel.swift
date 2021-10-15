//
//  UserViewModel.swift
//  UserViewModel
//
//  Created by Flávio Silvério on 14/10/2021.
//

import Foundation
import MapKit

final class UserViewModel: ObservableObject {
    @Published private var user: User?

    lazy var authorDescription: String = {
        return Strings.author + username  + " (\(email))"
    }()

    lazy var username: String = {
        user?.username ?? .empty
    }()

    lazy var email: String = {
        user?.email ?? .empty
    }()

    lazy var name: String = {
        user?.name ?? .empty
    }()

    lazy var phone: String = {
        user?.phone ?? .empty
    }()

    lazy var website: String = {
        user?.website ?? .empty
    }()

    lazy var address: String = {
        guard let street = user?.address.street,
              let suite = user?.address.suite,
              let city = user?.address.city
        else {
            return .empty
        }

        return street + .comma + suite + .comma + city
    }()

    lazy var region: MKCoordinateRegion = {

        // If there are no coordinates, show London
        let lat = Double(user?.address.geo.lat ?? .empty) ?? 51.5074
        let long = Double(user?.address.geo.lng ?? .empty) ?? 0.1278

        return MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: lat,
            longitude: long
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        )
    )
    }()

    lazy var postcode: String = {
        user?.address.zipcode ?? .empty
    }()

    lazy var latitude: Double = {
        guard let lat = Double(user?.address.geo.lat ?? .empty)
        else { return 0.0 }

        return lat
    }()

    lazy var longitude: Double = {
        guard let long = Double(user?.address.geo.lng ?? .empty)
        else { return 0.0 }

        return long
    }()

    lazy var company: String = {
        user?.company.name ?? .empty
    }()

    lazy var jobTitle: String = {
        user?.company.bs ?? .empty
    }()

    func setUser(_ user: User) {
        self.user = user
    }

    init() { }
}

