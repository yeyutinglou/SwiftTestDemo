//
//  Deck.swift
//  SwiftDemo
//
//  Created by jyd on 2018/10/22.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class Deck: NSObject {
    
    private let cards: [Flashcard]
    
    var randomCard: Flashcard? {
        if cards.isEmpty {
            return nil
        } else {
            return cards[Int(arc4random_uniform(UInt32(cards.count)))]
        }
    }
    
    override init() {
        let cardsData = [
            "controller outlet" : "A controller view property, marked with IBOutlet",
            "controller action" : "A controller method, marked with IBAction, that is triggered by an interface event."
        ]
        cards = cardsData.map { Flashcard (term: $0, definition: $1)}
    }

}
