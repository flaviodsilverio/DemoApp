//
//  UserViewModel.swift
//  UserViewModel
//
//  Created by Flávio Silvério on 14/10/2021.
//

import Foundation
import MapKit

class UserViewModel: ObservableObject {
    @Published private var user: User?

    lazy var authorDescription: String = {
        return "Author: " + username  + " (\(email)"
    }()

    lazy var username: String = {
        user?.username ?? ""
    }()

    lazy var email: String = {
        user?.email ?? ""
    }()

    lazy var name: String = {
        user?.name ?? ""
    }()

    lazy var phone: String = {
        user?.phone ?? ""
    }()

    lazy var website: String = {
        user?.website ?? ""
    }()

    lazy var address: String = {
        guard let street = user?.address.street,
              let suite = user?.address.suite,
              let city = user?.address.city
        else {
            return ""
        }

        return street + ", " + suite + ", " + city
    }()

    lazy var region: MKCoordinateRegion = {
        guard let lat = Double(user?.address.geo.lat ?? ""),
              let long = Double(user?.address.geo.lng ?? "") else {
                  fatalError()
              }


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
        user?.address.zipcode ?? ""
    }()

    lazy var latitude: Double = {
        guard let lat = Double(user?.address.geo.lat ?? "")
        else { return 0.0 }

        return lat
    }()

    lazy var longitude: Double = {
        guard let long = Double(user?.address.geo.lng ?? "")
        else { return 0.0 }

        return long
    }()

    lazy var company: String = {
        user?.company.name ?? ""
    }()

    lazy var jobTitle: String = {
        user?.company.bs ?? ""
    }()

    func setUser(_ user: User) {
        self.user = user
    }

    init() { }
}

