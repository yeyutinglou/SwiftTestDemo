//
//  TopMediaViewController.swift
//  SwiftTestDemo
//
//  Created by jyd on 2018/10/23.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit
import Foundation

class TopMediaViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBInspectable var feedURL: String!
    @IBInspectable var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let request = URLRequest(url: URL(string: feedURL)!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let jsonData = data {
                let feed = (try?  JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)) as? NSDictionary
                let fee = feed?.object(forKey: "feed") as? NSDictionary
                let entry = fee?.object(forKey: "entry") as? NSDictionary
                let name = entry?.object(forKey: "im:name") as? NSDictionary
                let title = name?.object(forKey: "label") as? String
                
                let imArtist = entry?.object(forKey: "im:artist") as? NSDictionary
                let artist = imArtist?.object(forKey: "label") as? String
                
                let image = entry?.object(forKey: "im:image") as? [NSDictionary]
                let imageUrl = image?.last
                if  let imageUrlStr = imageUrl?.object(forKey: "label") as? String {
                    self.loadImageFromURL(URL(string: imageUrlStr)!)
                }
                DispatchQueue.main.async {
                    self.titleLabel.text = title
                    self.titleLabel.isHidden = false
                    self.artistLabel.text = artist
                    self.artistLabel.isHidden = false
                }
            }
            
            

            
        }
        task.resume()
        
    }
    

    func loadImageFromURL(_ URL: URL) {
        let request = URLRequest(url: URL)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let imageData = data {
                DispatchQueue.main.async {
                      self.imageView.image = UIImage(data: imageData)
                }
              
            }
        }
        task.resume()
        
    }

}
