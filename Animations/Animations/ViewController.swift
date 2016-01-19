//
//  ViewController.swift
//  Animations
//
//  Created by James Carthew on 14/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var dinoImage: UIImageView!
    var frames = ["frame1.png", "frame2.png", "frame3.png", "frame4.png", "frame5.png", "frame6.png"]
    var frameCount = 0
    var play = false
    
    @IBAction func updateFrame(sender: AnyObject) {
        
        play = !play
        
    }
    
    func doAnimation() {
        if frameCount < 5 {
            frameCount += 1
        } else {
            frameCount = 0
        }
        if play {
            dinoImage.image = UIImage(named: frames[frameCount])
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var animationTimer = NSTimer()
        animationTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    // all object createdbut yet to be displayed
    override func viewDidLayoutSubviews() {
        dinoImage.center = CGPointMake(dinoImage.center.x - 400, dinoImage.center.y)
//        dinoImage.alpha = 0
//        dinoImage.frame = CGRectMake(dinoImage.center.x, dinoImage.center.y, 0, 0)
        
    }
    
    // called the moment the view appears on screen
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1,  animations: { () -> Void in
            self.dinoImage.center = CGPointMake(self.dinoImage.center.x + 400, self.dinoImage.center.y)
//            self.dinoImage.alpha = 1
//            self.dinoImage.frame = CGRectMake(self.dinoImage.center.x, self.dinoImage.center.y, 100, 200)
        })
    }
    
    //whenever anything global is in a clousure, need to be called as self.
    


}

