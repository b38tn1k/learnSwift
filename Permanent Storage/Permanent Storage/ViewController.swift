//
//  ViewController.swift
//  Permanent Storage
//
//  Created by James Carthew on 14/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // I commented this out and when the app loads it still works!!!!!! VVVV
        NSUserDefaults.standardUserDefaults().setObject("James", forKey: "name")
        
        let username = NSUserDefaults.standardUserDefaults().objectForKey("name")! as! String
        print(username)
        
//        let myArray = [1, 2, 3, 4]
//        NSUserDefaults.standardUserDefaults().setObject(myArray, forKey: "array")
        
        // to remove the optional type you need to force unwrap and cast to type (force cast)
        let array = NSUserDefaults.standardUserDefaults().objectForKey("array")! as! NSArray
//        print(array)
        
        for i in array {
            print(i)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

