//
//  ViewController.swift
//  navigation bar
//
//  Created by James Carthew on 12/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var timerOutlet: UILabel!
    
    var play = false
    var resetOnResume = false
    var totalTime = 0.0
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        play = true
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        play = false
        resetOnResume = true
    }
    
    @IBAction func pauseButtonPressed(sender: AnyObject) {
        play = false
    }
    func result() {
        
        if play {
            if resetOnResume {
                totalTime = 0.0
                resetOnResume = false
            }
            totalTime += 0.1
            timerOutlet.text = "\(totalTime)s"
        } else {
            timerOutlet.text = "\(totalTime)s"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timer = NSTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

