//
//  NYArticleDetailsPresenter.swift
//  NYTimes
//
//  Created by Essam on 5/27/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import UIKit

protocol NYArticleDetailsView: NYBaseView {
  func pind()
  func changeActivityIndicator(state visisble: Bool)
}

protocol NYArticleDetailsActions {
  func onViewDidLoaded()
  func onStartLoadingImage()
  func onStopLoadingImage()
}

class NYArticleDetailsPresenter: NYBasePresenter<NYArticleDetailsView>, NYArticleDetailsActions {
  func onViewDidLoaded() {
    view?.pind()
  }
  
  func onStartLoadingImage() {
    view?.changeActivityIndicator(state: true)
  }
  
  func onStopLoadingImage() {
    view?.changeActivityIndicator(state: false)
  }
}
