//
//  ViewController.swift
//  Times Tables
//
//  Created by James Carthew on 12/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet var sliderValue: UISlider!
    @IBOutlet var table: UITableView!
    
    var value = 10
    
    @IBAction func sliderMoved(sender: AnyObject) {
        value = Int(sliderValue.value * 20)
        print(value)
        table.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        let tempString = "\(indexPath.row + 1) x \(value) = \(value * (indexPath.row + 1))"
        cell.textLabel?.text = tempString
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

