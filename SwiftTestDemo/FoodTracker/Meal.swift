//
//  Meal.swift
//  SwiftTestDemo
//
//  Created by jyd on 2018/11/1.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class Meal: NSObject {
    
     // MARK: - Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
     // MARK: - Initialization
   init?(name: String, photo: UIImage?, rating: Int) {
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    
        self.name = name
        self.photo = photo
        self.rating = rating
    }

}
