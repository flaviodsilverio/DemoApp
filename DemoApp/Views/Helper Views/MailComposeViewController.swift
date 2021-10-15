//
//  MailComposeViewController.swift
//  MailComposeViewController
//
//  Created by Flávio Silvério on 15/10/2021.
//

import Foundation
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


