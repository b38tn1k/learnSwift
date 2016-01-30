//
//  ViewController.swift
//  Swipes and Shakes
//
//  Created by James Carthew on 29/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player = AVAudioPlayer()
    var sfxFileNames = ["sfx02", "sfx03", "sfx04", "sfx05", "sfx06", "sfx07", "sfx08", "sfx09", "sfx10", "sfx11", "sfx12", "sfx13", "sfx14", "sfx15", "sfx16", "sfx17", "sfx18", "sfx19"]
    var sfxFilePaths = [NSBundle.mainBundle().pathForResource("sfx01", ofType: "wav")]
    var beatFileNames = ["beat02", "beat03", "beat04", "beat05", "beat06", "beat07", "beat08", "beat09", "beat10", "beat11", "beat12"]
    var testFileNames = ["test1", "test2", "test3", "test4", "test5", "test6"]
    var beatFilePaths = [NSBundle.mainBundle().pathForResource("beat01", ofType: "wav")]
    
    var left: AVAudioPlayer = AVAudioPlayer()
    var right: AVAudioPlayer = AVAudioPlayer()
    var up: AVAudioPlayer = AVAudioPlayer()
    var down: AVAudioPlayer = AVAudioPlayer()
    var beatLoop: AVAudioPlayer = AVAudioPlayer()
    
    var upPlay = false
    var downPlay = false
    var leftPlay = false
    var rightPlay = false
    
    func getFilePaths() {
        for sfx in sfxFileNames {
            sfxFilePaths.append(NSBundle.mainBundle().pathForResource(sfx, ofType: "wav")!)
        }
        for beat in beatFileNames {
            beatFilePaths.append(NSBundle.mainBundle().pathForResource(beat, ofType: "wav")!)
        }
//        for sfx in testFileNames {
//            sfxFilePaths.append(NSBundle.mainBundle().pathForResource(sfx, ofType: "wav")!)
//        }
//        for beat in testFileNames {
//            beatFilePaths.append(NSBundle.mainBundle().pathForResource(beat, ofType: "wav")!)
//        }
    }
    
    func randomiseSamples(upPlaying : Bool, downPlaying : Bool, leftPlaying : Bool, rightPlaying : Bool) {
        print("randomising")
        let countBeat = beatFilePaths.count
        var chooseBeat = Int(arc4random_uniform(UInt32(countBeat)))
        do {
            try beatLoop = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: beatFilePaths[chooseBeat]!))
//            beatLoop.play()
        } catch {
            //process error here
        }
        var countSFX = sfxFilePaths.count
        if leftPlaying != true {
            countSFX = sfxFilePaths.count
            chooseBeat = Int(arc4random_uniform(UInt32(countSFX)))
            
            do {
                try left = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: sfxFilePaths[chooseBeat]!))
                sfxFilePaths.removeAtIndex(chooseBeat)
                //            beatLoop.play()
            } catch {
                //process error here
            }
        }
        
        if rightPlaying != true {
            countSFX = sfxFilePaths.count
            chooseBeat = Int(arc4random_uniform(UInt32(countSFX)))
            
            do {
                try right = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: sfxFilePaths[chooseBeat]!))
                sfxFilePaths.removeAtIndex(chooseBeat)
                //            beatLoop.play()
            } catch {
                //process error here
            }
        }
        
        if upPlaying != true {
            countSFX = sfxFilePaths.count
            chooseBeat = Int(arc4random_uniform(UInt32(countSFX)))
            
            do {
                try up = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: sfxFilePaths[chooseBeat]!))
                sfxFilePaths.removeAtIndex(chooseBeat)
                //            beatLoop.play()
            } catch {
                //process error here
            }
        }
        
        if downPlaying != true {
            countSFX = sfxFilePaths.count
            chooseBeat = Int(arc4random_uniform(UInt32(countSFX)))
            
            do {
                try down = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: sfxFilePaths[chooseBeat]!))
                sfxFilePaths.removeAtIndex(chooseBeat)
                //            beatLoop.play()
            } catch {
                //process error here
            }
        }
        
        beatLoop.numberOfLoops = -1
        left.numberOfLoops = -1
        right.numberOfLoops = -1
        up.numberOfLoops = -1
        down.numberOfLoops = -1
        
        getFilePaths()
        
    }

    override func viewDidLoad() {
        
        getFilePaths()
        randomiseSamples(false, downPlaying: false, leftPlaying: false, rightPlaying: false)
        
        super.viewDidLoad()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        let stopGesture = UILongPressGestureRecognizer(target: self, action: "stop")
        self.view.addGestureRecognizer(stopGesture)
    }
    
    func stop(){
        beatLoop.pause()
        right.pause()
        left.pause()
        up.pause()
        down.pause()
    }
    
    func swiped(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                print("right")
                right.play()
                upPlay = false
                downPlay = false
                leftPlay = false
                rightPlay = true
                right.currentTime = NSTimeInterval(Float(beatLoop.currentTime) + 0.095)
                up.stop()
                down.stop()
                left.stop()
            case UISwipeGestureRecognizerDirection.Up:
                print("up")
                up.play()
                upPlay = true
                downPlay = false
                leftPlay = false
                rightPlay = false
                up.currentTime = NSTimeInterval(Float(beatLoop.currentTime) + 0.095)
                down.stop()
                left.stop()
                right.stop()
            case UISwipeGestureRecognizerDirection.Left:
                print("left")
                upPlay = false
                downPlay = false
                leftPlay = true
                rightPlay = false
                left.play()
                left.currentTime = NSTimeInterval(Float(beatLoop.currentTime) + 0.095)
                up.stop()
                down.stop()
                right.stop()
            case UISwipeGestureRecognizerDirection.Down:
                print("down")
                down.play()
                down.currentTime = NSTimeInterval(Float(beatLoop.currentTime) + 0.095)
                up.stop()
                left.stop()
                right.stop()
                upPlay = false
                downPlay = true
                leftPlay = false
                rightPlay = false
            default:
                break
            }
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {
            print("shake")
            randomiseSamples(upPlay, downPlaying: downPlay, leftPlaying: leftPlay, rightPlaying: rightPlay)
            beatLoop.play()
            if upPlay == true {
                beatLoop.currentTime = NSTimeInterval(Float(up.currentTime) + 0.095)
            } else if downPlay == true {
                beatLoop.currentTime = NSTimeInterval(Float(down.currentTime) + 0.095)
            } else if leftPlay == true {
                beatLoop.currentTime = NSTimeInterval(Float(left.currentTime) + 0.095)
            } else if rightPlay == true {
                beatLoop.currentTime = NSTimeInterval(Float(right.currentTime) + 0.095)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

