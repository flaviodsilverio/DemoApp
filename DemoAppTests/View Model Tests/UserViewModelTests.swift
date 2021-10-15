//
//  UserViewModelTests.swift
//  UserViewModelTests
//
//  Created by Flávio Silvério on 15/10/2021.
//

import XCTest
@testable import DemoApp

fileprivate enum TestUserProperties {
 static let id = 1
    static let username = "user1"
    static let name = "name1"
    static let email = "email1"
    static let addressStreet = "street1"
    static let addressSuite = "suite1"
    static let addressCity = "city1"
    static let addressZipcode = "12345"
    static let addressGeoLat = "34.556"
    static let addressGeoLong = "34.556"
    static let phone = "12345"
    static let website = "sampleWebsite.com"
    static let companyName = "company"
    static let companyBS = "companyBS"
    static let companyCatchphrase = "companyCatchphrase"

}

class UserViewModelTests: XCTestCase {
    func testAddressGeneratesCorrectly() {
        let sut = UserViewModel.create()

        let desiredOutput = TestUserProperties.addressStreet
        + .comma
        + TestUserProperties.addressSuite
        + .comma
        + TestUserProperties.addressCity

        XCTAssertEqual(sut.address, desiredOutput)
    }

    func testAuthorInformationGeneratescorrectly() {
        let sut = UserViewModel.create()

        let desiredOutput = Strings.author
        + TestUserProperties.username
        + " "
        + "("
        + TestUserProperties.email
        + ")"

        XCTAssertEqual(sut.authorDescription, desiredOutput)
    }
}

extension User {
    static func TestUser() -> User {
        return User(
            id: TestUserProperties.id,
            username: TestUserProperties.username,
            name: TestUserProperties.name,
            email: TestUserProperties.email,
            address: Address(
                street: TestUserProperties.addressStreet,
                suite: TestUserProperties.addressSuite,
                city: TestUserProperties.addressCity,
                zipcode: TestUserProperties.addressZipcode,
                geo: Address.Geo(
                    lat: TestUserProperties.addressGeoLat,
                    lng: TestUserProperties.addressGeoLong
                )),
            phone: TestUserProperties.phone,
            website: TestUserProperties.website,
            company: Company(
                name: TestUserProperties.companyName,
                catchPhrase: TestUserProperties.companyCatchphrase,
                bs: TestUserProperties.companyBS)
        )
    }
}

extension UserViewModel {
    static func create() -> UserViewModel {
        let userViewModel = UserViewModel()

        userViewModel.setUser(User.TestUser())

        return userViewModel
    }

}

