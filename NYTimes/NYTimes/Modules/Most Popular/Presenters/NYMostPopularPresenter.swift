//
//  NYMostPopularPresenter.swift
//  NYTimes
//
//  Created by Essam on 5/27/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import UIKit

protocol NYMostPopularView: NYBaseView {
  func showDetailsScreen(_ report: NYArticle)
  func showNews(_ news: [NYArticle])
}

protocol NYMostPopularActions: NYBasePresenter {
  associatedtype T = NYMostPopularView
  func onViewDidLoaded()
  func onViewDidMoreArticles()
  func onViewDidFilter(_ word: String?)
  func onViewDidRequestDetails(_ report: NYArticle)
}

class NYMostPopularPresenter: NYMostPopularActions {
  weak var view: NYMostPopularView?

  var filtered: [NYArticle] = [] {
    didSet{
      if filtered.isEmpty {
        view?.showNews(self.news.articles)
      } else {
        view?.showNews(filtered)
      }
    }
  }
  
  var filterring = false

  var news = NYNews() {
    didSet{
      view?.showNews(self.news.articles)
    }
  }
  
  let service = NYMostPopularServices()

  func onViewDidLoaded() {
    view?.showHud()
    service.startService(parameters: nil) {[weak self] (News, Error) in
      self?.view?.hideHud()
      if let _Error = Error {
        self?.view?.show(messageAlert: _Error.error.localizedDescription,
                         message: nil,
                         actionTitle: nil,
                         action: nil)
      }
      if let _news = (News as? NYNews) {
        _news.articles.forEach { $0.saveToRealm() }
        self?.news = _news
      } else {
        let _news = NYNews()
        _news.articles = NYArticle.storedObjects() as! [NYArticle]
        self?.news = _news
      }
    }
  }
  
  func onViewDidFilter(_ word: String?) {
    if let text = word {
      filtered = news.articles.filter({ (report) -> Bool in
        return report.adx_keywords.lowercased().contains(text.lowercased())
      })
      filterring = true
    }
    else {
      filterring = false
      filtered = []
    }
  }
  
  func onViewDidRequestDetails(_ report: NYArticle) {
    view?.showDetailsScreen(report)
  }
  
  func onViewDidMoreArticles() {
    if filterring {
      return
    }
    
    // Not Implemented As The API Does Not Support Pagination
  }
}
