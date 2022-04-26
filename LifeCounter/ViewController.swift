//
//  ViewController.swift
//  LifeCounter
//
//  Created by Helen Li on 4/21/22.
//

import UIKit

class ViewController: UIViewController {
    // score tracking for the 2 players
    var score1 = 20
    var score2 = 20
    
    // score labels for the 2 players
    @IBOutlet weak var scoreLabel1: UILabel!
    @IBOutlet weak var scoreLabel2: UILabel!
    
    // game ending labels for the 2 players
    @IBOutlet weak var endLabel1: UILabel!
    @IBOutlet weak var endLabel2: UILabel!
    
    // update the score label for player 1
    func updateScoreLabel1() {
        scoreLabel1.text = "\(score1)"
    }
    
    // update the score label for player 2
    func updateScoreLabel2() {
        scoreLabel2.text = "\(score2)"
    }
    
    // if score1 <= 0, display label indicating that player 1 loses
    func updateEndLabel1() {
        if (score1 <= 0) {
            endLabel1.isHidden = false
        }
    }
    
    // if score2 <= 0, display label indicating that player 2 loses
    func updateEndLabel2() {
        if (score2 <= 0) {
            endLabel2.isHidden = false
        }
    }
    
    // returns true if game has not ended
    func gameNotEnd() -> Bool {
        return score1 > 0 && score2 > 0
    }
    
    // player 1 "+" button
    @IBAction func btnIncOne1(_ sender: UIButton) {
        if (gameNotEnd()) {
            score1 += 1
            updateScoreLabel1()
            updateEndLabel1()
        }
    }
    
    // player 1 "-" button
    @IBAction func btnDecOne1(_ sender: UIButton) {
        if (gameNotEnd()) {
            score1 -= 1
            updateScoreLabel1()
            updateEndLabel1()
        }
    }
    
    // player 1 "+5" button
    @IBAction func btnIncFive1(_ sender: UIButton) {
        if (gameNotEnd()) {
            score1 += 5
            updateScoreLabel1()
            updateEndLabel1()
        }
    }
    
    // player 1 "-5" button
    @IBAction func btnDecFive1(_ sender: UIButton) {
        if (gameNotEnd()) {
            score1 -= 5
            updateScoreLabel1()
            updateEndLabel1()
        }
    }
    
    // player 2 "+" button
    @IBAction func btnIncOne2(_ sender: UIButton) {
        if (gameNotEnd()) {
            score2 += 1
            updateScoreLabel2()
            updateEndLabel2()
        }
    }
    
    // player 2 "-" button
    @IBAction func btnDecOne2(_ sender: UIButton) {
        if (gameNotEnd()) {
            score2 -= 1
            updateScoreLabel2()
            updateEndLabel2()
        }
    }
    
    // player 2 "+5" button
    @IBAction func btnIncFive2(_ sender: UIButton) {
        if (gameNotEnd()) {
            score2 += 5
            updateScoreLabel2()
            updateEndLabel2()
        }
    }
    
    // player 2 "-5" button
    @IBAction func btnDecFive2(_ sender: UIButton) {
        if (gameNotEnd()) {
            score2 -= 5
            updateScoreLabel2()
            updateEndLabel2()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        endLabel1.text = "Player 1 LOSES!"
        endLabel1.isHidden = true
        
        endLabel2.text = "Player 2 LOSES!"
        endLabel2.isHidden = true
        
        updateScoreLabel1()
        updateScoreLabel2()
    }
}
