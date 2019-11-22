//
//  ViewController.swift
//  IceCreamPicker
//
//  Created by Brandon Adiele on 11/22/19.
//  Copyright © 2019 Brandon Adiele. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{
    
    let iceCreamFlavors = ["Chocolate", "Vanilla", "Mint Chocolate", "Birthday Cake"]
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return iceCreamFlavors[row]
    }
    
    @IBAction func iceCreamButton(_ sender: Any) {
        let row = pickerView.selectedRow(inComponent: 0)
        iceCreamLabel.text = "You ordered: " + iceCreamFlavors[row] + ", congrats!"
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var iceCreamLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return iceCreamFlavors.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

}

