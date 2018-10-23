//
//  DefinitionViewController.swift
//  SwiftDemo
//
//  Created by jyd on 2018/10/22.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

    @IBOutlet weak var definition: UITextView!
    
    var flashcard: Flashcard?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let card = flashcard {
            definition.text = card.definition
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let search = segue.destination as? SearchViewController {
            search.flashcard = flashcard
        }
    }

}
