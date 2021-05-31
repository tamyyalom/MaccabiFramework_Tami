//
//  MaccabiFrameworkTests.swift
//  MaccabiFrameworkTests
//
//  Created by Tami Yalon on 30/05/2021.
//  Copyright © 2021 Tami yallon. All rights reserved.
//

import XCTest
@testable import MaccabiFramework

class MaccabiFrameworkTests: XCTestCase {
    
    var sut: URLSession!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = URLSession(configuration: .default)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidApiCallGetsHTTPStatusCode200() throws {
        
        let urlString = ApiPath.baseUrl.rawValue + ApiPath.mock5.rawValue
        let url = URL(string: urlString)!
        let promise = expectation(description: "Status code: 200")
        
       sut.dataTask(with: url) { _, response, error in
            
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }.resume()
        
        wait(for: [promise], timeout: 5)
    }
    
    // Asynchronous test: faster fail
    func testApiCallCompletes() throws {
        
        let urlString = ApiPath.baseUrl.rawValue + ApiPath.mock5.rawValue
        let url = URL(string: urlString)!
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        sut.dataTask(with: url) { _, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }.resume()
        
        wait(for: [promise], timeout: 5)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
}
