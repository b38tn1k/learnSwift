//
//  ViewController.swift
//  Keyboard Control
//
//  Created by James Carthew on 14/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var inputText: UITextField!
    @IBOutlet var outputLabel: UILabel!
    @IBAction func submitButton(sender: AnyObject) {
        outputLabel.text = inputText.text!
    }
    
    // tap outside the keybaord to shut it down
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true) //close the keyboard
    }
    
    // on clicking return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder() //close the keyboard
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // linking the text field to the textField delegate
        self.inputText.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

