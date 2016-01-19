//
//  ViewController.swift
//  Stopwatch
//
//  Created by James Carthew on 12/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var play = false
    var resetOnResume = false
    var totalTime = 0
    @IBOutlet var timeOutlet: UILabel!
    
    @IBAction func playButtonPressed(sender: AnyObject) {
        play = true
    }
    @IBAction func pauseButtonPressed(sender: AnyObject) {
        play = false
    }
    @IBAction func stopButtonPressed(sender: AnyObject) {
        play = false
        resetOnResume = true
    }
    
    func result() {
        if play {
            if resetOnResume {
                totalTime = 0
                resetOnResume = false
            }
            totalTime += 1
        }
        timeOutlet.text = "\(totalTime)s"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var timer = NSTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

