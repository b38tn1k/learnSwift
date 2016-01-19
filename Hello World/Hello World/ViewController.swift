//
//  ViewController.swift
//  Hello World
//
//  Created by James Carthew on 6/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var updateTextLabel: UILabel!
    @IBOutlet var numberField: UITextField!
    @IBOutlet var stringBox: UITextField!

    @IBAction func submitText(sender: AnyObject) {
        print("you pressed the button!")
        updateTextLabel.text = numberField.text
        numberField.text = stringBox.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("hello world")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

