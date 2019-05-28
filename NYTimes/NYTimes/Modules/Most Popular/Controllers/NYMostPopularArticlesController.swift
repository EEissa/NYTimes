//
//  NYMostPopularController.swift
//  NYTimes
//
//  Created by Essam on 5/27/19.
//  Copyright © 2019 Essam. All rights reserved.
//

import UIKit
import SDWebImage

class NYMostPopularArticlesController: NYViewController  {
  
  var presenter = NYMostPopularPresenter()

  var news: [NYArticle] = []  {
    didSet {
      table.reloadData()
    }
  }
  
  lazy var table: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    return tableView
  }()
  
  var tableConstraints: [NSLayoutConstraint]  {
    var constraints = [NSLayoutConstraint]()
    constraints.append(NSLayoutConstraint(item: self.table, attribute: .left, relatedBy: .equal,
                                          toItem: self.view, attribute: .left, multiplier: 1.0, constant: 1.0))
    constraints.append(NSLayoutConstraint(item: self.table, attribute: .right, relatedBy: .equal,
                                          toItem: self.view, attribute: .right, multiplier: 1.0, constant: 1.0))
    constraints.append(NSLayoutConstraint(item: self.table, attribute: .top, relatedBy: .equal,
                                          toItem: self.view, attribute: .top, multiplier: 1.0, constant: 1.0))
    constraints.append(NSLayoutConstraint(item: self.table, attribute: .bottom, relatedBy: .equal,
                                          toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 1.0))
    return constraints
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor.white
    title = "News"
    
    self.navigationController?.navigationBar.prefersLargeTitles = true
    
    let search = UISearchController(searchResultsController: nil)
    search.searchResultsUpdater = self
    navigationItem.searchController = search
    
    view.addSubview(table)
    NSLayoutConstraint.activate(tableConstraints)
    
    presenter.attach(this: self)
    presenter.onViewDidLoaded()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  deinit {
    presenter.detach(this: self)
  }
}


extension NYMostPopularArticlesController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return news.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "\n\(news[indexPath.row].title)\n"
    cell.textLabel?.numberOfLines = 0
    if let media = news[indexPath.row].media.first {
      if let meta = media.mediaMetadata.first {
        if let url = URL(string: meta.url) {
          cell.imageView?.sd_setImage(with: url, completed: nil)
        }
      }
    }
    return cell
  }
}

extension NYMostPopularArticlesController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    presenter.onViewDidRequestDetails(news[indexPath.row])
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row == news.count - 1  {
      presenter.onViewDidMoreArticles()
    }
  }
}

extension NYMostPopularArticlesController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    presenter.onViewDidFilter(searchController.searchBar.text)
  }
}


extension NYMostPopularArticlesController: NYMostPopularView {
  func showNews(_ news: [NYArticle]) {
    self.news = news
  }
  
  func showDetailsScreen(_ report: NYArticle) {
    navigationController?.pushViewController(NYArticleDetailsController(report),
                                             animated: true)
  }
}
