//
//  ViewController.swift
//  audio example
//
//  Created by James Carthew on 29/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    var isPaused = false
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var scrubSlider: UISlider!
    var duration: NSTimeInterval!
    let audioPath = NSBundle.mainBundle().pathForResource("chopin-28-4-stahlbrand", ofType: "mp3")!
    
    @IBAction func play(sender: AnyObject) {
        if isPaused == false {
            
            do {
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
                player.play()
                player.volume = volumeSlider.value
                duration = player.duration
                scrubSlider.maximumValue = Float(duration)
            } catch {
                //process error here
            }
        } else {
            player.play()
            isPaused = false
        }
        print(duration)
    }

    @IBAction func scrub(sender: AnyObject) {
        player.currentTime = NSTimeInterval(scrubSlider.value)
    }
    
    @IBAction func pause(sender: AnyObject) {
        player.pause()
        isPaused = true
    }

    @IBAction func volume(sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    
    func updateScrubber() {
        scrubSlider.value = Float(player.currentTime)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            player.volume = volumeSlider.value
            duration = player.duration
            scrubSlider.maximumValue = Float(duration)
        } catch {
            //process error here
        }
        _ = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateScrubber", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

