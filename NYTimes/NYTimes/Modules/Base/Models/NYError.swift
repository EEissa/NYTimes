//
//  NYError.swift
//  NYTimes
//
//  Created by Essam on 5/27/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import UIKit

enum NYErrorType: Int, Error {
  case known = 1
  case defaultError = 2
  case unhandled = 3

  var localizedDescription: String {
    switch self {
    case .known:
      return "known Error"
    case .defaultError:
      return "Default Error"
    case .unhandled:
      return "Unhandled Error"
    }
  }
  var code: Int { return self.rawValue }
}


class NYError: Error {
  var type : NYErrorType!
  var error: NSError!


  
  init(_ code: Int) {
    if let _NYErrorType = NYErrorType(rawValue: code) {
      type = _NYErrorType
    } else {
      type = NYErrorType.unhandled
    }
    error = NSError(domain: "", code: 0, userInfo: [ NSLocalizedDescriptionKey: type.localizedDescription])
  }
  
  init(_ error: Error?) {
    if let _error = error as NSError? {
      if let _NYErrorType = NYErrorType(rawValue: _error.code) {
        type = _NYErrorType
      } else {
        type = NYErrorType.unhandled
      }
      self.error = NSError(domain: "", code: _error.code, userInfo: [ NSLocalizedDescriptionKey: _error.localizedDescription])
    } else {
      type = NYErrorType.unhandled
      self.error = NSError(domain: "", code: type.code, userInfo: [ NSLocalizedDescriptionKey: type.localizedDescription])
    }
  }
}
