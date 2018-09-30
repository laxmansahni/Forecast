//
//  ForecastTests.swift
//  ForecastTests
//
//  Created by Laxman Sahni on ३०/९/१८.
//  Copyright © २०१८ Nagarro. All rights reserved.
//

import XCTest
@testable import Forecast

class ForecastTests: XCTestCase {
    var apiManagerUnderTest: APIManager!
    var viewControllerUnderTest: ViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiManagerUnderTest = APIManager()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateInitialViewController() as! ViewController
        self.viewControllerUnderTest.viewDidLoad()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiManagerUnderTest = nil
        viewControllerUnderTest = nil
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToForecastGetsHTTPStatusCode200() {
        // given
        // 1
        let promise = expectation(description: "Status code: 200")
        
        apiManagerUnderTest.getForecast() { (forecast, error) in
            // when
            if let error = error {
                print("Get forecast error: \(error.localizedDescription)")
                return
            } else if forecast != nil {
                promise.fulfill()
                
            }
        }
        
        
        // 3
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToOrderGetsHTTPStatusCode200() {
        // given
        // 1
        let promise = expectation(description: "Status code: 200")
        
        apiManagerUnderTest.getOrder() { (order, error) in
            // when
            if let error = error {
                print("Get forecast error: \(error.localizedDescription)")
                return
            } else if order != nil {
                promise.fulfill()
                
            }
        }
        
        
        // 3
        waitForExpectations(timeout: 5, handler: nil)
    }

}
