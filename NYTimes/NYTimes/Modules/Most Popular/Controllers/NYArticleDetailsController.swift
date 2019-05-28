//
//  NYArticleDetailsController.swift
//  NYTimes
//
//  Created by Essam on 5/27/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import UIKit



class NYArticleDetailsController: NYViewController {

   let presenter = NYArticleDetailsPresenter()
  @IBOutlet var thumbnilImageView: UIImageView!
  @IBOutlet var activityThumbNilLoader: UIActivityIndicatorView!
  @IBOutlet var postTitle: UILabel!
  @IBOutlet var publishedDate: UILabel!
  
  @IBOutlet var postDetails: UILabel!
  @IBOutlet var byWriter: UILabel!
  
  var article: NYArticle!
  
  convenience init(_ article: NYArticle) {
    self.init()
    self.article = article
  }
 
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.attach(this: self)
    presenter.onViewDidLoaded()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.prefersLargeTitles = false
  }
  
  deinit {
    presenter.detach(this: self)
  }

}

extension NYArticleDetailsController: NYArticleDetailsView {
  func pind() {
    title = article.title
    postTitle.text = article.title
    byWriter.text = "🖋️ Writer: " + article.byline
    publishedDate.text = "🗒️ Published : " + article.published_date
    postDetails.text = article.abstract
    
    if let media = article.media.first {
      if let meta = media.mediaMetadata.first {
        if let url = URL(string: meta.url) {
          presenter.onStartLoadingImage()
          thumbnilImageView.sd_setImage(with: url, placeholderImage: UIImage(named:"Logo"),
                                        options: .refreshCached) {[weak self] (_, _, _, _) in
                                          self?.presenter.onStopLoadingImage()
          }
        }
      }
    }
  }
  
  func changeActivityIndicator(state visisble: Bool) {
    DispatchQueue.main.async { () -> Void in
      
      if visisble {
        self.activityThumbNilLoader.startAnimating()
        self.activityThumbNilLoader.isHidden = false
      } else {
        self.activityThumbNilLoader.stopAnimating()
        self.activityThumbNilLoader.isHidden = true
      }
    }
  }
}
