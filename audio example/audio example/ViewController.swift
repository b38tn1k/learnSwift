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
    
    @IBAction func play(sender: AnyObject) {
        if isPaused == false {
            let audioPath = NSBundle.mainBundle().pathForResource("chopin-28-4-stahlbrand", ofType: "mp3")!
            do {
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
                player.play()
                player.volume = volumeSlider.value
            } catch {
                //process error here
            }
        } else {
            player.play()
            isPaused = false
        }
    }

    @IBAction func pause(sender: AnyObject) {
        player.pause()
        isPaused = true
    }

    @IBAction func volume(sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

