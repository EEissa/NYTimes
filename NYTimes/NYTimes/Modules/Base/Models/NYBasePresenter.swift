//
//  NYBaseService.swift
//  NYTimes
//
//  Created by Essam on 5/26/19.
//  Copyright © 2019 Essam. All rights reserved.
//


import UIKit

class NYBasePresenter<View> {
  var view: View?
  
  func attach(this view: View) {
    self.view = view
  }
  
  func detach(this view: View) {
    self.view = nil
  }
}



