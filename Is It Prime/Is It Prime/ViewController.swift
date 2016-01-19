//
//  ViewController.swift
//  Is It Prime
//
//  Created by James Carthew on 12/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var inputNumber: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func submitButton(sender: AnyObject) {
        if let _ = Int(inputNumber.text!) {
            var isPrime = true
            var divisors:[Int] = []
            let input = Int(inputNumber.text!)!
            for var i = 2; i < input; i++ {
                if input % i == 0 {
                    isPrime = false
                    divisors.append(i)
                }
            }
            print(isPrime)
            inputNumber.text = ""
            if !isPrime {
                print(divisors)
                resultLabel.text = "\(input) is not Prime"
            } else {
                resultLabel.text = "\(input) is Prime!"
            }
        } else {
            resultLabel.text = "Please Enter a Number"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        resultLabel.text = " "
    }


}


