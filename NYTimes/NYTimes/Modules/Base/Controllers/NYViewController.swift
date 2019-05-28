//
//  NYViewController.swift
//  NYTimes
//
//  Created by Essam on 5/26/19.
//  Copyright © 2019 Essam. All rights reserved.
//


import UIKit
import MBProgressHUD

protocol NYBaseView: class {
  func retry()
  func showHud()
  func showHud(_ message: String)
  func hideHud()
  func show(messageAlert title: String, message: String?, actionTitle: String?, action: ((UIAlertAction) -> Void)?)
}

class NYViewController: UIViewController {
  
  var layoutedOnce = false
  
  public var shouldHideNavigationBar: Bool {
    return false
  }
  
  public var shouldAddBackButton: Bool {
    return false
  }
  
  init() {
    let expectedClassName = String(describing: type(of: self))
    let expectedNibName = String(describing: type(of: self)).replacingOccurrences(of: "Controller", with: "")
    if  Bundle.main.path(forResource:expectedNibName, ofType: "nib") != nil {
      super.init(nibName: expectedNibName, bundle: nil)
    } else {
      print("Cannot find Nib:\(expectedNibName) for Controller:\(expectedClassName)")
      fatalError("Cannot find Nib:\(expectedNibName) for Controller:\(expectedClassName)")
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    if navigationItem.leftBarButtonItems == nil {
      navigationItem.leftBarButtonItems = []
    }
    if navigationItem.rightBarButtonItems == nil {
      navigationItem.rightBarButtonItems = []
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(shouldHideNavigationBar, animated: false)
  }
  
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
  }
  
  func showHud() {
    MBProgressHUD.showAdded(to: view, animated: true)
  }
  
  func showHud(_ message: String) {
    let hud = MBProgressHUD.showAdded(to: view, animated: true)
    hud.detailsLabel.text = message
  }
  
  func hideHud() {
    MBProgressHUD.hide(for: view, animated: true)
  }
  
  func retry() {
    
  }
  
  func show(messageAlert title: String, message: String? = "", actionTitle: String? = nil, action: ((UIAlertAction) -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: actionTitle == nil ? "Close" : actionTitle!,
                                  style: .cancel,
                                  handler: action))
    present(alert, animated: true, completion: nil)
  }

}
