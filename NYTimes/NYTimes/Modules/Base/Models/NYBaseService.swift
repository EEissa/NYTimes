//
//  NYBaseService.swift
//  NYTimes
//
//  Created by Essam on 5/26/19.
//  Copyright © 2019 Essam. All rights reserved.
//


import UIKit
import Alamofire

protocol NYBaseServiceProtocol {
  func startService(parameters: [String: Any]?, completion: NetworkResultClosure)
}

class NYBaseService: NSObject {
}
