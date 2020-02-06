//
//  PostmanEchoTests.swift
//  PostmanEchoTests
//
//  Created by Benjamin Stone on 2/6/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import XCTest
@testable import PostmanEcho

class PostmanEchoTests: XCTestCase {
    func testExample() {
        let users = BundleFetchingService<User>().getArray(from: "userData", ofType: "json")
        XCTAssertEqual(users.count, 300, "Was expecting 300 users, but got \(users.count)")
    }
}
