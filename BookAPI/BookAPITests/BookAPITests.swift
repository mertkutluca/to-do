//
//  BookAPITests.swift
//  BookAPITests
//
//  Created by mert.kutluca on 15.03.2021.
//

import XCTest
import Foundation
@testable import BookAPI

class BookAPITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func decodingTest() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let bundle = Bundle(for: BookAPITests.self)
        guard let url = bundle.url(forResource: "book", withExtension: "json") else {
            XCTFail()
            return
        }
        let data = try Data(contentsOf: url)
        
        let book = try JSONDecoder().decode(Book.self, from: data)
        
        XCTAssertEqual(book, Book(artist: "William Shakespeare",
                                  name: "Romeo and Juliet",
                                  imageUrl: URL(string: "https://is2-ssl.mzstatic.com/image/thumb/Publication113/v4/6f/a7/29/6fa729bd-5a1c-f488-d5d1-e846803c7a18/PD_Romeo_and_Juliet-Adj.jpg/200x200bb.png")))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
