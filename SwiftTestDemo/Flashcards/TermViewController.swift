//
//  TermViewController.swift
//  SwiftDemo
//
//  Created by jyd on 2018/10/22.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class TermViewController: UIViewController {

    @IBOutlet weak var termLabel: UILabel!
    
    let deck = Deck()
    var flashCard: Flashcard?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let flashcard = deck.randomCard {
            self.flashCard = flashcard
            termLabel.text = flashcard.term
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let definitionController = segue.destination as? DefinitionViewController {
            definitionController.flashcard = flashCard
        }
    }
    



}
