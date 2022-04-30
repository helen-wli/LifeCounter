//
//  ViewController.swift
//  LifeCounter
//
//  Created by Helen Li on 4/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnAddPlayer: UIButton!
    @IBOutlet weak var btnHistory: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    
    var allPlayers: [Player] = []
    
    var history: [String] = []
    
    // returns true if game over, false otherwise
    func overallGameOver() -> Bool {
        var numLost = 0
        for player in allPlayers {
            if player.gameOver() {
                numLost += 1
            }
        }
        return allPlayers.count - numLost <= 1
    }
    
    // returns true if game started, false otherwise
    func overallGameStarted() -> Bool {
        var flag = false
        for player in allPlayers {
            if player.score != 20 {
                flag = true
            }
        }
        return flag
    }
    
    func setAddPlayerBtn() {
        if overallGameStarted() && !overallGameOver() {
            btnAddPlayer.isEnabled = false
        } else {
            btnAddPlayer.isEnabled = true
        }
    }
    
    func displayGameOver() {
        if overallGameOver() {
            gameOverLabel.isHidden = false
            btnOk.isHidden = false
            btnReset.isHidden = true
        }
    }
    
    @IBAction func btnAddPlayerClicked(_ sender: Any) {
        if allPlayers.count < 8 {
            allPlayers.append(Player())
            tableView.reloadData()
        }
    }
    
    @IBAction func btnHistoryClicked(_ sender: Any) {
        performSegue(withIdentifier: "ShowHistory", sender: self)
    }
    
    func reset() {
        allPlayers = [Player(), Player(), Player(), Player()]
        history = []
        
        tableView.reloadData()
    }
    
    @IBAction func btnOkClicked(_ sender: Any) {
        reset()
        gameOverLabel.isHidden = true
        btnOk.isHidden = true
        btnAddPlayer.isEnabled = true
    }
    
    @IBAction func btnResetClicked(_ sender: Any) {
        reset()
        btnAddPlayer.isEnabled = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHistory" {
            if let hisVC = segue.destination as? HistoryViewController {
                hisVC.historyRecord = "\(history)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        btnHistory.setTitle("History", for: .normal)
        btnAddPlayer.setTitle("Add Player", for: .normal)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        for _ in 0...3 {
            let newPlayer = Player()
            allPlayers.append(newPlayer)
        }
        
        gameOverLabel.text = "Game Over!"
        gameOverLabel.isHidden = true
        
        btnOk.setTitle("OK", for: .normal)
        btnOk.isHidden = true
        
        btnReset.setTitle("Reset", for: .normal)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell {
            cell.player = allPlayers[indexPath.section]
            cell.configureCell()
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: TableViewCellProtocol {
    func btnIncOneClicked(_ score: Int) {
        displayGameOver()
        setAddPlayerBtn()
        history.append("+\(score)")
    }
    
    func btnIncValClicked(_ score: Int) {
        displayGameOver()
        setAddPlayerBtn()
        history.append("+\(score)")
    }
    
    func btnDecOneClicked(_ score: Int) {
        displayGameOver()
        setAddPlayerBtn()
        history.append("-\(score)")
    }
    
    func btnDecValClicked(_ score: Int) {
        displayGameOver()
        setAddPlayerBtn()
        history.append("-\(score)")
    }
}
