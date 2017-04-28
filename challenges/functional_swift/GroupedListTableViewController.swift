//
//  GroupedListTableViewController.swift
//  functional_swift
//
//  Created by Callum McColl on 25/4/17.
//  Copyright © 2017 Callum McColl. All rights reserved.
//

import UIKit

class GroupedListTableViewController: UITableViewController {

    let content: [[(String, Phone)]] = groupedSortedList(fromData: data)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsets(top: 20,left: 0,bottom: 0,right: 0)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.content.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.content[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupedCell", for: indexPath)
        let (name, phone) = self.content[indexPath.section][indexPath.row]
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = phone.rawValue
        return cell
    }

}
