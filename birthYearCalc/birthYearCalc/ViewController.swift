//
//  ViewController.swift
//  birthYearCalc
//
//  Created by Brandon Adiele on 9/23/19.
//  Copyright © 2019 Brandon Adiele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
@IBOutlet weak var ageText: UITextField!
@IBOutlet weak var yearAnswer: UILabel!
    @IBOutlet weak var yearSwitch: UISwitch!
    var currentYear = 2019
    //var currentAge = 0
    var yourAge = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func restartButton(_ sender: Any) {
        ageText.text = ""
        yearAnswer.text = ""
    }
    
    @IBAction func yearCalc(_ sender: Any) {
        let ageNumber = Int(ageText.text!)!
        let birthYear = currentYear - ageNumber + yourAge
        yearAnswer.text = "\(birthYear)"
    }
    
    @IBAction func birthSwitch(_ sender: Any) {
        if yearSwitch.isOn {
            yourAge = 0
        } else {
            yourAge = -1
        }
    }
}

