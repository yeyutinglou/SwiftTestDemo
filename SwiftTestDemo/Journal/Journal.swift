//
//  Journal.swift
//  SwiftTestDemo
//
//  Created by jyd on 2018/10/23.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class Journal: NSObject {
    private var entries: [JournalEntry]
    var count: Int {
        return entries.count
    }
    
    init(entries: [JournalEntry]) {
        self.entries = entries
    }
    
    func addEntry(_ entry: JournalEntry) {
        entries.append(entry)
    }
    
    func entry(_ index: Int) -> JournalEntry? {
        if index > 0 && index < count {
            return entries[index]
        } else {
            return nil
        }
    }

}
