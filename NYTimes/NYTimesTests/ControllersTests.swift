//
//  ControllersTests.swift
//  NYTimesTests
//
//  Created by Essam on 5/28/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import XCTest
@testable import NYTimes

class ControllersTests: XCTestCase {

  var articlesController: NYMostPopularArticlesController!
  var detailsController: NYArticleDetailsController!

  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    articlesController = nil
    detailsController = nil
    
    super.tearDown()
  }
  
  func testArticlesController () {
    // Given
    articlesController = NYMostPopularArticlesController()
    // Then
    XCTAssertNotNil(articlesController)
  }
  
  func testDetailsController() {
    // Given
    detailsController = NYArticleDetailsController(NYArticle())
    // Then
    XCTAssertNotNil(detailsController)
  }
}
