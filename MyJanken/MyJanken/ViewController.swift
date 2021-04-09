//
//  ViewController.swift
//  MyJanken
//
//  Created by Udagawa Yuya on 2020/12/27.
//  Copyright © 2020 Udagawa Yuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var answerImageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    var answerNumber = Int.random(in: 0..<3)

    @IBAction func shuffleAction(_ sender: Any) {
        var newAnswerNumber = 0
        repeat {
            newAnswerNumber = Int.random(in: 0..<3)
        } while answerNumber == newAnswerNumber
        answerNumber = newAnswerNumber
        
        if answerNumber == 0 {
            answerLabel.text = "グー"
            answerImageView.image = UIImage(named:"gu")
        } else if answerNumber == 1 {
            answerLabel.text = "チョキ"
            answerImageView.image = UIImage(named:"choki")
        } else if answerNumber == 2 {
            answerLabel.text = "パー"
            answerImageView.image = UIImage(named:"pa")
        }
    }
}

