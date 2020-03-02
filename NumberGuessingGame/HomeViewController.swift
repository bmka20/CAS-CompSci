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
    var numberOfButtons = 1
    @IBOutlet weak var Light: UIButton!
    @IBOutlet weak var Mid: UIButton!
    @IBOutlet weak var Hard: UIButton!
    
    var nums = (1...100).map{$0}
    var vcType = 0
    
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
        
        numberOfButtons = nums[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 1, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let vc = segue.destination as? ViewController, let sender = sender as? UIPickerView {
     if sender == numberPicker {
     vc.numberPicked = numberOfButtons
     }
     
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
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let numberVC = segue.destination as? ViewController, let sender = sender as? UIButton {
            if sender == Light {
                numberVC.checker = "Easy"
            }
            if sender == Mid {
                numberVC.checker = "Medium"
            }
            if sender == Hard {
                numberVC.checker = "Hard"
            }
        }
        
    }
}
