//
//  NewJournalEntryViewController.swift
//  SwiftTestDemo
//
//  Created by jyd on 2018/10/23.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class NewJournalEntryViewController: UIViewController {

    @IBOutlet weak var contents: UITextView!
    var journal: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func save(_ sender: Any) {
        let entry = JournalEntry(date: Date(), contents: contents.text)
        journal?.addEntry(entry)
        dismiss(animated: true, completion: nil)
    }
    

}
