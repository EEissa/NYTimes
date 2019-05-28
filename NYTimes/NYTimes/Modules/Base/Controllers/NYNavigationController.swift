//
//  NYNavigationController.swift
//  NYTimes
//
//  Created by Essam on 5/26/19.
//  Copyright © 2019 Essam. All rights reserved.
//


import UIKit

class NYNavigationController: UINavigationController {
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
  }
}
