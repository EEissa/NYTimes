//
//  NYBaseService.swift
//  NYTimes
//
//  Created by Essam on 5/26/19.
//  Copyright © 2019 Essam. All rights reserved.
//


import UIKit

protocol NYBasePresenter: class {
  associatedtype T
  var view: T? {get set}
  func attach(this view: T)
  func detach(this view: T)
}

extension NYBasePresenter {
  func attach(this view: T) {
    self.view = view
  }
  func detach(this view: T) {
    self.view = nil
  }
}

//class NYBasePresenter<View> {
//  var view: View?
//
//  func attach(this view: View) {
//    self.view = view
//  }
//
//  func detach(this view: View) {
//    self.view = nil
//  }
//}



