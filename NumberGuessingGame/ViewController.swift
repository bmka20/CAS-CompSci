//
//  ViewController.swift
//  NumberGuessingGame
//
//  Created by Brandon Adiele on 2/12/20.
//  Copyright © 2020 Brandon Adiele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    @objc func over() { //you decorate the func with objective c so you can call it with the selector.
           let alert = UIAlertController(title: "Welp ):", message: "That's tuff bruh, you picked the wrong number. It's lower than this...", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { (_)  in return   }))
               self.present(alert, animated: true, completion: {})
           
       }
    
    @objc func under() { //you decorate the func with objective c so you can call it with the selector.
           let alert = UIAlertController(title: "Welp ):", message: "That's tuff bruh, you picked the wrong number. It's higher than this...", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { (_)  in return   }))
               self.present(alert, animated: true, completion: {})
           
       }
    
    @objc func correct() { //you decorate the func with objective c so you can call it with the selector.
           let alert = UIAlertController(title: "This is correct!", message: "Good job! Took you long enough...", preferredStyle: .alert)
               self.present(alert, animated: true, completion: {})
           
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         let randomNum = Int.random(in: 1...50)
        (1...50).map({ (i) -> UIButton in //I need to change the 50 on this line to the number of the pickerView
            let newButton = UIButton()
            newButton.setTitle("Button \(i)", for: .normal)
                newButton.frame = CGRect(x: 0, y: 0, width: 400, height: 100)
            newButton.setTitleColor(UIColor(displayP3Red: 0, green: 0, blue: 1, alpha: 1), for: .normal)
            let mult = 1.0 / Double(50 - 1)
            newButton.backgroundColor = UIColor(cgColor: CGColor(srgbRed: CGFloat(mult*Double(i)), green: CGFloat(1 - mult*Double(i)), blue: CGFloat(mult*Double(i)), alpha: 1))
            self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
               stackView.addArrangedSubview(newButton)
            if i < randomNum {
                newButton.addTarget(self, action: #selector(under), for: .touchUpInside)
              }
              else if i > randomNum {
                newButton.addTarget(self, action: #selector(over), for: .touchUpInside)
              }
              else{
                newButton.addTarget(self, action: #selector(correct), for: .touchUpInside)
              }
            return newButton
        })
            stackView.frame = CGRect(x: 0, y: 0, width: 400, height: 50*25)
            scrollView.contentSize = CGSize(width: 400, height: 50*25)
        }
    

   /*
     
     override func prepare(for segue: UIPickerViewDelegate, sender: Any?) {
         let numberOfButtons =
     }
     
    func randomNumber() {
        let randomNum = Int.random(in: 1...50)
        let b = randomNum
        if UIButton.newButton != b {
        UIButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        } else {
            let alert = UIAlertController(title: "This is correct!", message: "Good job! Took you long enough...", preferredStyle: .alert)
        }
    }
 */
    
}
   // extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//}

