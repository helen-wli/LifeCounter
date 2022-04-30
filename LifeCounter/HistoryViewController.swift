//
//  HistoryViewController.swift
//  LifeCounter
//
//  Created by Helen Li on 4/29/22.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var btnDismiss: UIButton!
    @IBOutlet weak var historyLabel: UITextView!
    
    var historyRecord = ""
    
    @IBAction func btnDismissClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        historyLabel.text = historyRecord
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
