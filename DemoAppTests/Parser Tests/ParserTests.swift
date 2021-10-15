//
//  ParserTests.swift
//  ParserTests
//
//  Created by Flávio Silvério on 15/10/2021.
//

import XCTest
@testable import DemoApp

class ParserTests: XCTestCase {
    enum Values {
        static let name = "test1"
        static let address = "test2"
        static let age = 26
    }

    func testParserParsesCorrectly() throws {

        let object = TestStruct(
            name: Values.name,
            address: Values.address,
            age: Values.age)

        let data = try JSONEncoder().encode(object)

        let testedObject = Parser().parse(data, ofType: TestStruct.self)

        XCTAssertEqual(testedObject?.age, Values.age)
        XCTAssertEqual(testedObject?.name, Values.name)
        XCTAssertEqual(testedObject?.address, Values.address)

    }
}

struct TestStruct: Codable {
    let name: String
    let address: String
    let age: Int
}
