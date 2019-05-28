//
//  NYMediaMetadata.swift
//  NYTimes
//
//  Created by Essam on 5/27/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import UIKit
import ObjectMapper

class NYMediaMetadata: NYBaseModel {
  @objc dynamic var url: String = ""
  @objc dynamic var format: String = ""
  @objc dynamic var height: Int = 0
  @objc dynamic var width:  Int  = 0

  required convenience init?(map: Map) { self.init() }
  override func mapping(map: Map) {
    super.mapping(map: map)
    url <- map["url"]
    format <- map["format"]
    height <- map["height"]
    width <- map["width"]
  }
}
