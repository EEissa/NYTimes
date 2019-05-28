//
//  Constants.swift
//  NYTimes
//
//  Created by Essam on 5/27/19.
//  Copyright © 2019 Essam. All rights reserved.
//
import UIKit
import SwiftyUserDefaults

struct  Notifications {
  static let  appStarted      = "kAppStartedNotification";
}

extension DefaultsKeys {
  static let kAppLaunched     = DefaultsKey<Bool>("kAppLaunched")
}


func ApplicationDelegate() -> AppDelegate{
  return UIApplication.shared.delegate as! AppDelegate
}
