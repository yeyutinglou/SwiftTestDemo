//
//  Meal.swift
//  SwiftTestDemo
//
//  Created by jyd on 2018/11/1.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    
    
    
     // MARK: - Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
     // MARK: - Archiving Paths
    static var documentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentDirectory.appendingPathComponent("meals")
    
     // MARK: - Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    
    // MARK: - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            fatalError("not name")
        }
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        self.init(name: name, photo: photo, rating: rating)
    }
    
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
