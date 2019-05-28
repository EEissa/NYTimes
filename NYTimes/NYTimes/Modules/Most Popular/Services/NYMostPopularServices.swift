//
//  NYMostPopularServices.swift
//  NYTimes
//
//  Created by Essam on 5/27/19.
//  Copyright © 2019 Essam. All rights reserved.
//


import UIKit
import Alamofire

let kMostPopularPath = "viewed/7.json"

class NYMostPopularServices: NYBaseService {
  func startService(parameters: [String: Any]?, completion: @escaping NetworkResultClosure) {
    let request = NYNetworkRequest(withMethod: .get,
                                   Path: kMostPopularPath,
                                   BodyParameters: parameters,
                                   Headers: [:],
                                   Encoding: URLEncoding.default)
    NYNetworkClient.startRequest(requestConfiguration: request, withMappingClass: NYNews()) { (resutl, error) in
      completion(resutl,error)
    }
  }
}
