//
//  HomeViewController.swift
//  NumberGuessingGame
//
//  Created by Brandon Adiele on 2/18/20.
//  Copyright © 2020 Brandon Adiele. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var numberPicker: UIPickerView!
    
    let nums = (1...100).map{$0}
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(nums[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nums.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let numberOfButtons = nums[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 1, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let numberPicked = segue.destination as! ViewController
        if let indexPath = self.numberPicker {
            let theNumber = self.nums[indexPath.row]
        }
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
