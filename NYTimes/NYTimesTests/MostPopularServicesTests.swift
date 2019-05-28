//
//  NYTimesTests.swift
//  NYTimesTests
//
//  Created by Essam on 5/28/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import XCTest

@testable import NYTimes

class NYArticleModelTests: XCTestCase {
  
  let service = NYMostPopularServices()
  
  func testGetMostPopular() {
    let promise = expectation(description: "MostPopular")
    service.startService(parameters: [:]) { (model, error) in
      if let _error = error {
        XCTFail("Error: \(_error.error.localizedDescription)")
      } else {
        if let _model = model as? NYNews {
          XCTAssertTrue(_model.reports.count > 0)
          promise.fulfill()
        } else {
          XCTFail("Error: In Mapping")
        }
      }
    }
    waitForExpectations(timeout: 5, handler: nil)
  }
}
