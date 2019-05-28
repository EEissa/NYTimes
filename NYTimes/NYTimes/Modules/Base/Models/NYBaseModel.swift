//
//  NYBaseService.swift
//  NYTimes
//
//  Created by Essam on 5/26/19.
//  Copyright © 2019 Essam. All rights reserved.
//


import UIKit
import ObjectMapper
import RealmSwift

class NYBaseModel: Object, Mappable {
  required convenience init?(map: Map) { self.init() }
  func mapping(map: Map) {
  }
  
  class func removeObjects() {
    let realm = try! Realm()
    try! realm.write {
      realm.objects(self).forEach { realm.delete($0) }
    }
  }
  
  class func storedObjects() -> [NYBaseModel] {
    var objects: [NYBaseModel] = []
    let realm = try! Realm()
    for object in realm.objects(self) {
      objects.append(object)
    }
    return objects.reversed()
  }
  
  func saveToRealm() {
    let realm = try! Realm()
    try! realm.write {
      realm.add(self, update: true)
    }
  }  
}

class NYRealmString: Object, Mappable {
  @objc dynamic var value: String = ""
  
  required convenience init?(map: Map) { self.init() }
  func mapping(map: Map) {
    value <- map["value"]
  }
  
  convenience init(_ value: String) {
    self.init() ;
    self.value = value
  }
}
