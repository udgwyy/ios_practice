//
//  ViewController.swift
//  MtFirst
//
//  Created by Udagawa Yuya on 2020/12/27.
//  Copyright © 2020 Udagawa Yuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "Hello Swift!"
    }

    @IBOutlet weak var outputLabel: UILabel!
}

