//
//  OtherStackViewController.swift
//  dynamicStackView
//
//  Created by Brandon Adiele on 2/6/20.
//  Copyright © 2020 Brandon Adiele. All rights reserved.
//

import UIKit

class OtherStackViewController: UIViewController {
    
    @IBOutlet var allTheViews: [UIView]! {
        didSet {
            allTheViews.forEach {
                $0.isHidden = true
                //takes the value of the view and makes the rest "hidden"
            }
        }
    }
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        for i in allTheViews {
            i.isHidden = true
        }
 */
        // Do any additional setup after loading the view.
        }
    
    func hideViews() {
        UIView.animate(withDuration: 0.3) {
            self.allTheViews.forEach {
                $0.isHidden = !$0.isHidden
                //this basically just inverts the code in the didSet and makes the hidden views reappear. The bang sets the boolean(isHidden) to false, thus making it do the opposite.
            }
        }
    }
    
    @IBAction func dropDownButton(_ sender: Any) {
        hideViews()
        
    }
    
    @IBAction func ripButton(_ sender: Any) {
        hideViews()
        label.text = " 🙏🏿"
    }
    
    @IBAction func senioritisButton(_ sender: Any) {
        hideViews()
        label.text = "😷"
    }
    
    @IBAction func clippersButton(_ sender: Any) {
        hideViews()
        label.text = "🤡"
    }
    
    @IBAction func uncommonButton(_ sender: Any) {
        hideViews()
        label.text = "🏊🏿‍♂️"
    }
    
    @IBAction func schoolButton(_ sender: Any) {
        hideViews()
        label.text = "💀"
    }
    
    @IBAction func kanyeButton(_ sender: Any) {
        hideViews()
        label.text = "🐐"
    }
    
    @IBAction func cutiePieButton(_ sender: Any) {
        hideViews()
        label.text = "😍"
    }
}
