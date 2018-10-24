//
//  JournalTableViewController.swift
//  SwiftTestDemo
//
//  Created by jyd on 2018/10/23.
//  Copyright © 2018年 jyd. All rights reserved.
//

import UIKit

class JournalTableViewController: UITableViewController {
    let cellReuseIdentifier = "JournalEntryCell"
    let journalEntrySegueIdentifier = "journalEntry"
    let newJournalEntrySegueIdentifier = "newJournalEntry"
    let joural = Journal(entries: (0..<7).map {JournalEntry(date: Date(), contents: "Contents for entry \($0)")})

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return joural.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)

        if let label = cell.textLabel,
            let entry = joural.entry(indexPath.row)
        {
            label.text = "\(entry)"
        }

        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == journalEntrySegueIdentifier {
            if let journalEntry = segue.destination as? JournalEntryViewController,
                 let cell = sender as? UITableViewCell,
            let indexPath = self.tableView.indexPath(for: cell),
            let entry = joural.entry(indexPath.row){
               
                 journalEntry.journalEntry = entry
                
            }
        } else if segue.identifier == newJournalEntrySegueIdentifier {
            if let newJournal = segue.destination as? NewJournalEntryViewController {
                newJournal.journal = joural
            }
        }
    }
    
}
