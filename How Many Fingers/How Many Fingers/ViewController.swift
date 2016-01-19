//
//  ViewController.swift
//  How Many Fingers
//
//  Created by James Carthew on 12/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var randomNumber: Int!
    @IBOutlet var playerGuess: UITextField!
    @IBOutlet var gameMessage: UILabel!
    @IBAction func playerSubmit(sender: AnyObject) {
        if playerGuess.text != "" {
            let guess = Int(playerGuess.text!)!
            if randomNumber < guess {
                gameMessage.text = "lower"
                playerGuess.text = ""
            } else if randomNumber > guess {
                gameMessage.text = "higher"
                playerGuess.text = ""
            } else {
                gameMessage.text = "you win!"
                playerGuess.text = ""
                randomNumber = Int(arc4random_uniform(10) + 1)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameMessage.text = " "
        randomNumber = Int(arc4random_uniform(10) + 1)
        print("hi")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

