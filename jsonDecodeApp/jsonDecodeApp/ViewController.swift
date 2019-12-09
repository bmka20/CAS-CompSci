//
//  ViewController.swift
//  jsonDecodeApp
//
//  Created by Riley John Gibbs on 12/3/19.
//  Copyright © 2019 Riley John Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var jsonFileData: Data?
    var jsonFileString: String?

    // TODO: Come up with a better UI than just a single boring label.
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json") {
            jsonFileData = try? Data(contentsOf: fileUrl)
            jsonFileString = try? String(contentsOf: fileUrl)
            self.view.backgroundColor = UIColor.yellow
        }
    
        
        // This just puts the file contents (unparsed) into the label.
        if let string = jsonFileString {
            textView.text = string
            textView.textColor = UIColor.purple
            textView.backgroundColor = UIColor.yellow
            
        }
        
        if let data = jsonFileData {
            // TODO: Parse the JSON data and display it in the app.
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            let dictionary = json as! [String: Any]
            let nba = dictionary["nba"] as! String
            let players = dictionary["players"] as! [String]
            let wins = dictionary["wins"] as! Int
            textView.text = ("The \(nba) have the best team in the league. They have \(wins) wins. Their roster includes: \(players.joined(separator: ",")). \n #Purple&Gold #LakeShow ")
        }
        
        
    }

}

/*
 let dictionary = json as! [String: Any]{
 let name = dictionary["nba"] as! String
 let hobbies = dictionary["players"] as! [String]
 let age = dictionary["wins"] as! Int
 textView.text = ("the \(nba) is the best team in the league. They have \(wins) wins. Their roster includes: \(players.joined(separator: ",")).")
 */

