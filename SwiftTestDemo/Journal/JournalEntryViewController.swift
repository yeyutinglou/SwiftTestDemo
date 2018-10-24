//
//  JournalEntryViewController.swift
//  SwiftTestDemo
//
//  Created by jyd on 2018/10/23.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class JournalEntryViewController: UIViewController {

    @IBOutlet weak var contents: UITextView!
    var journalEntry: JournalEntry?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let journalEntry = journalEntry {
            contents.text = journalEntry.contents
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
