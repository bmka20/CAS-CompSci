//
//  KingStackViewController.swift
//  dynamicStackView
//
//  Created by Brandon Adiele on 2/6/20.
//  Copyright © 2020 Brandon Adiele. All rights reserved.
//

import UIKit

class KingStackViewController: UIViewController {
    
    var labelCount = 5
    
    @IBOutlet weak var lordStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let labels = (1...labelCount).map({ (x) -> UILabel in
            let newLabel = UILabel()
            newLabel.text = "Hello World \(x)"
            return newLabel
        })
        for (x, label) in labels.enumerated() {
            label.textAlignment = .center
           
            let mult = 1.0 / Double(labelCount - 1)
            label.backgroundColor = UIColor(cgColor: CGColor(srgbRed: CGFloat(mult*Double(x)), green: CGFloat(1 - mult*Double(x)), blue: CGFloat(mult*Double(x)), alpha: 1))
            
            lordStackView.addArrangedSubview(label)
            let constraint = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: labels[0], attribute: .height, multiplier: 1, constant: 0)
            if x != 0 {
                lordStackView.addConstraint(constraint)
            }
        }
    }
}
