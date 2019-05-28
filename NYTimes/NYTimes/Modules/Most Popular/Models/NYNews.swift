//
//  NYNewsModel.swift
//  NYTimes
//
//  Created by Essam on 5/27/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import ObjectMapper

let kNewsPageCount = 20

class NYNews: NYBaseModel {
  var articles: [NYArticle] = []
  var numResults: Int = 0
  var hasMorePages: Bool {
    return (articles.count + 20) > numResults
  }

  required convenience init?(map: Map) { self.init() }
  override func mapping(map: Map) {
    super.mapping(map: map)
    articles <- map["results"]
    numResults <- map["num_results"]
  }

}
