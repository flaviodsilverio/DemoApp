//
//  MapView.swift
//  MapView
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
import MapKit
import SwiftUI

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
