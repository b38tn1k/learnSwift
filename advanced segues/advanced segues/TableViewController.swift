//
//  TableViewController.swift
//  advanced segues
//
//  Created by James Carthew on 27/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello world")
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        rowCounter = indexPath.row
        return indexPath
    }

}
