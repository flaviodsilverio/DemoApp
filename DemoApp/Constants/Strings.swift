//
//  Strings.swift
//  Strings
//
//  Created by Flávio Silvério on 13/10/2021.
//

import Foundation

enum Strings {
    enum API {
        static let baseURLPath = "https://jsonplaceholder.typicode.com/"
        static let comments = "comments/"
        static let users = "users/"
        static let posts = "posts/"
        static let postIDPostfix = "?postId="
    }

    enum Titles {
        static let postList = "Post List"
        static let postDetails = "Post Details"
        static let userDetails = "User Details"
        static let personalDetails = "Personal Details"
        static let employment = "Employment"
        static let address = "Address"
        static let name = "Name"
        static let username = "Username"
        static let email = "Email"
        static let phone = "Phone"
        static let website = "Website"
        static let postcode = "Postcode"
        static let employer = "Employer"
        static let jobDescription = "Job Description"
        static let shareSheetTitle = "Look at this awesome post!"
        static let allComments = "All Comments"
    }

    enum ImageNames {
        static let shareButton = "square.and.arrow.up"
    }

    static let author = "Author: "
    static let helloParagraph = "<p>Hello!</p>"
}
