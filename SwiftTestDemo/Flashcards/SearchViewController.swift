//
//  SearchViewController.swift
//  SwiftDemo
//
//  Created by jyd on 2018/10/22.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var flashcard: Flashcard?
    let baseSearchURL = "http://www.baidu.com/baidu?wd=apple developer"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let card = flashcard, let urlString = searchURLString(baseSearchURL, term: card.term), let url = URL(string: urlString)
         {
            webView.loadRequest(URLRequest(url: url))
        }
    }
    

    private func searchURLString(_ base: String, term: String) -> String? {
        return "\(baseSearchURL) \(term)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }

}
