//
//  BookstoreTests.swift
//  BookstoreTests
//
//  Created by Leonardo Simoza on 17/07/21.
//

import XCTest
@testable import Bookstore

class BookstoreTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDataTaskPublisher() {
        // setup
        let expectation = XCTestExpectation(description: "Download from \(String(describing: Endpoint.books))")
        let remoteDataPublisher = URLSession.shared.dataTaskPublisher(for: Endpoint.books.urlRequest)
            // validate
            .sink(receiveCompletion: { result in
                print(".sink() received the completion", String(describing: result))
                switch result {
                case .finished: expectation.fulfill()
                case .failure: XCTFail()
                }
            }, receiveValue: { (data, response) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    XCTFail("Unable to parse response an HTTPURLResponse")
                    return
                }
                XCTAssertNotNil(data)
                print(".sink() data received \(data)")
                XCTAssertNotNil(httpResponse)
                XCTAssertEqual(httpResponse.statusCode, 200)
                print(".sink() httpResponse received \(httpResponse)")
            })
        
        XCTAssertNotNil(remoteDataPublisher)
        wait(for: [expectation], timeout: 5.0)
    }
    
}
