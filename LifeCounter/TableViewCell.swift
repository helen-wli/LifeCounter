//
//  TableViewCell.swift
//  LifeCounter
//
//  Created by Helen Li on 4/29/22.
//

import UIKit

protocol TableViewCellProtocol: AnyObject {
    func btnIncOneClicked(_ score: Int)
    func btnIncValClicked(_ score: Int)
    func btnDecOneClicked(_ score: Int)
    func btnDecValClicked(_ score: Int)
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnIncOne: UIButton!
    @IBOutlet weak var btnIncVal: UIButton!
    @IBOutlet weak var btnDecOne: UIButton!
    @IBOutlet weak var btnDecVal: UIButton!
    
    @IBOutlet weak var playerName: UITextField!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    
    var player: Player!
    
    weak var delegate: TableViewCellProtocol?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        player = nil
    }
    
    func configureCell() {
        btnIncOne.setTitle("+1", for: .normal)
        btnIncVal.setTitle("+5", for: .normal)
        btnDecOne.setTitle("-1", for: .normal)
        btnDecVal.setTitle("-5", for: .normal)
        playerName.text = "Anonymous"
        scoreLabel.text = "\(player.score)"
        loseLabel.isHidden = true
    }
    
    func displayGameOver() {
        if (player.gameOver()) {
            loseLabel.isHidden = false
        }
    }
    
    @IBAction func btnIncOneClicked(_ sender: Any) {
        if (!player.gameOver()) {
            player.incOne()
            scoreLabel.text = "\(player.score)"
            delegate?.btnIncValClicked(1)
            
            displayGameOver()
        }
    }
    
    @IBAction func btnIncValClicked(_ sender: Any) {
        if (!player.gameOver()) {
            player.incVal(5)
            scoreLabel.text = "\(player.score)"
            delegate?.btnIncValClicked(5)
            
            displayGameOver()
        }
    }
    
    @IBAction func btnDecOneClicked(_ sender: Any) {
        if (!player.gameOver()) {
            player.decOne()
            scoreLabel.text = "\(player.score)"
            delegate?.btnDecOneClicked(1)
            
            displayGameOver()
        }
    }
    
    @IBAction func btnDecValClicked(_ sender: Any) {
        if (!player.gameOver()) {
            player.decVal(5)
            scoreLabel.text = "\(player.score)"
            delegate?.btnDecValClicked(5)
            
            displayGameOver()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
