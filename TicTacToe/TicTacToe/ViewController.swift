//
//  ViewController.swift
//  TicTacToe
//
//  Created by James Carthew on 18/01/2016.
//  Copyright © 2016 spacemonkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button: UIButton!
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    let empty = 0
    let noughts = 1
    let crosses = 2
    var gameActive = true
    @IBOutlet var playAgainButton: UIButton!
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBAction func playAgain(sender: AnyObject) {
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameActive = true
        
        var tempButton : UIButton
        
        for var i = 0; i < 9; i++ {
            tempButton = view.viewWithTag(i) as! UIButton
            tempButton.setImage(nil, forState: .Normal)
        }
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
    }
    

    @IBAction func buttonPressed(sender: AnyObject) {
        if gameState[sender.tag] == empty && gameActive {
            if activePlayer == noughts {
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                gameState[sender.tag] = activePlayer
                activePlayer = crosses
            } else {
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                gameState[sender.tag] = activePlayer
                activePlayer = noughts
            }
        }
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[1]] == gameState[combination[0]] && gameState[combination[1]] == gameState[combination[2]] {
                if gameState[combination[0]] == noughts {
                    gameOverLabel.text = "Noughts have won!"
                } else {
                    gameOverLabel.text = "Crosses have won!"
                }
                gameActive = false
                endGame()
            }
        }
        
        if gameState.reduce(0, combine: +) >= 13 && gameActive {
            gameOverLabel.text = "It's a Draw!"
            gameActive = false
            endGame()
        }
    }
    
    func endGame() {
        var tempButton : UIButton
        for var i = 0; i < 9; i++ {
            tempButton = view.viewWithTag(i) as! UIButton
            tempButton.enabled = false
        }
        playAgainButton.enabled = false
        gameOverLabel.hidden = false
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
        })
        playAgainButton.hidden = false
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
        })
        playAgainButton.enabled = true
        for var i = 0; i < 9; i++ {
            tempButton = view.viewWithTag(i) as! UIButton
            tempButton.enabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

