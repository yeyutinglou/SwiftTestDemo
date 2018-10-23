//
//  Flashcard.swift
//  SwiftDemo
//
//  Created by jyd on 2018/10/22.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class Flashcard: NSObject {
    var term: String
    var definition: String
    
    init(term: String, definition: String) {
        self.term = term
        self.definition = definition
    }
    
    convenience override init() {
        self.init(term: "Default term", definition: "Default definition")
    }

}
