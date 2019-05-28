//
//  NYReportModel.swift
//  NYTimes
//
//  Created by Essam on 5/27/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import ObjectMapper
import ObjectMapper_Realm
import RealmSwift

class NYArticle: NYBaseModel {
  @objc dynamic var url: String = ""
  @objc dynamic var adx_keywords: String = ""
  @objc dynamic var column: String = ""
  @objc dynamic var section: String = ""
  @objc dynamic var byline: String = ""
  @objc dynamic var type: String = ""
  @objc dynamic var title: String = ""
  @objc dynamic var abstract: String = ""
  @objc dynamic var published_date: String = ""
  @objc dynamic var source: String = ""
  @objc dynamic var id: String = ""
  @objc dynamic var asset_id: Int = 0
  @objc dynamic var views: Int = 0
  @objc dynamic var uri: String = ""

  var des_facet = List<NYRealmString>()
  var org_facet = List<NYRealmString>()
  var per_facet = List<NYRealmString>()
  var geo_facet = List<NYRealmString>()
  var media     = List<NYReportMedia>()

  required convenience init?(map: Map) { self.init() }
  override func mapping(map: Map) {
    super.mapping(map: map)
    url <- map["url"]
    adx_keywords <- map["adx_keywords"]
    column <- map["column"]
    section <- map["section"]
    byline <- map["byline"]
    type <- map["type"]
    title <- map["title"]
    abstract <- map["abstract"]
    published_date <- map["published_date"]
    source    <- map["source"]
    id = "\(map["id"].currentValue ?? "0")"
    asset_id  <- map["asset_id"]
    views     <- map["views"]
    des_facet <- (map["des_facet"], ListTransform<NYRealmString>())
    org_facet <- (map["org_facet"], ListTransform<NYRealmString>())
    per_facet <- (map["per_facet"], ListTransform<NYRealmString>())
    geo_facet <- (map["geo_facet"], ListTransform<NYRealmString>())
    media     <- (map["media"], ListTransform<NYReportMedia>())
    uri       <- map["uri"]
  }
  
  @objc open override class func primaryKey() -> String? { return "id" }
}
