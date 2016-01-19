//
//  ViewController.swift
//  Cat Years
//
//  Created by James Carthew on 7/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var catAgeTextField: UITextField!
    @IBOutlet var catAgeResultLabel: UILabel!

    @IBAction func findAge(sender: AnyObject) {
        var catAge = Int(catAgeTextField.text!)!
        catAge = catAge * 7
        catAgeResultLabel.text = "Your Cat is \(catAge) Cat Years Old"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        catAgeResultLabel.text = " "
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

