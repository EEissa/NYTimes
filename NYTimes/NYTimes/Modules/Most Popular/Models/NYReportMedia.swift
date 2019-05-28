//
//  NYReportMedia.swift
//  NYTimes
//
//  Created by Essam on 5/27/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class NYReportMedia: NYBaseModel {
  @objc dynamic var type: String = ""
  @objc dynamic var subtype: String = ""
  @objc dynamic var caption: String = ""
  @objc dynamic var copyright:  String = ""
  @objc dynamic var approvedForSyndication: Int = 0
  var mediaMetadata = List<NYMediaMetadata>()

  required convenience init?(map: Map) { self.init() }
  override func mapping(map: Map) {
    super.mapping(map: map)
    type <- map["type"]
    subtype <- map["subtype"]
    caption <- map["caption"]
    copyright <- map["copyright"]
    approvedForSyndication <- map["approved_for_syndication"]
    mediaMetadata <- (map["media-metadata"], ListTransform<NYMediaMetadata>())
  }
}
