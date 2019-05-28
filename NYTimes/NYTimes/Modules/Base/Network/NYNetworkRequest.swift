//
//  NYNetworkRequest.swift
//  NYTimes
//
//  Created by Essam on 5/26/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import Alamofire

let APIKeys = "bC666NNGVkQ4wZVT8PkUNh4VuhQwQ7fD"
enum ServerAddress: String {
  case staging = "http://api.nytimes.com/svc/mostpopular/v2/"
  case quality = " "
  case production  = "  "
}

let serverAddress: ServerAddress = .staging

class NYNetworkRequest: NSObject {
  
  var baseURL: String {
    return serverAddress.rawValue
  }
  var completeURL: String {
    return self.baseURL + self.path
  }
  
  var requestMethod: HTTPMethod
  var path: String!
  var parameters: [String : Any]
  var headers: [String : String]?
  var modelClass: AnyObject?
  var encoding: ParameterEncoding
  
  init(withMethod Method: HTTPMethod,
       Path path: String,
       BodyParameters parameters: [String : Any]?,
       Headers headers: [String: String]?,
       Encoding encoding: ParameterEncoding) {
    self.path = path
    
    self.parameters = parameters ?? [:]
    self.parameters["api-key"] = APIKeys
    
    self.headers = headers
    self.requestMethod = Method
    self.encoding = encoding
  }
}
