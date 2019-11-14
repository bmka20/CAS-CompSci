//
//  ViewController.swift
//  boatDictionary
//
//  Created by Brandon Adiele on 11/13/19.
//  Copyright © 2019 Brandon Adiele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var boat:Boat?
    
    var boatTypes: String = ""
    var boatDef: String = ""
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = boat?.name
        detailsLabel.text = "\(boat!.color), \(boat!.dolphinPower) dolphin power, \(boat!.size)!!!"

        // Do any additional setup after loading the view.
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
