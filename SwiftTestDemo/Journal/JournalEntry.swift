//
//  JournalEntry.swift
//  SwiftTestDemo
//
//  Created by jyd on 2018/10/23.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class JournalEntry: CustomStringConvertible {
    var description: String {
        return dateFormatter.string(from: date)
    }
    

    let date: Date
    let contents: String
    let dateFormatter = DateFormatter()
    
    init(date: Date, contents: String) {
        self.date = date
        self.contents = contents
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
    }
}
