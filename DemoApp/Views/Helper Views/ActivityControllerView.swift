//
//  ActivityControllerView.swift
//  ActivityControllerView
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
import UIKit
import SwiftUI

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
