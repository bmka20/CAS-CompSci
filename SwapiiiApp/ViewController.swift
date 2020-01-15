//
//  ViewController.swift
//  SwapiiiApp
//
//  Created by Brandon Adiele on 12/11/19.
//  Copyright © 2019 Brandon Adiele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressOne(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/planets/2/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
            let dictionary: [String: Any]? = json as? [String: Any]
            if let dictionary = dictionary {
            let name: String? = dictionary["name"] as? String
            if let name = name {
            label.text = name
                    }
                }
            }
        }
    }
    @IBAction func pressTwo(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/planets/3/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
            let dictionary: [String: Any]? = json as? [String: Any]
            if let dictionary = dictionary {
            let name: String? = dictionary["name"] as? String
            if let name = name {
            label.text = name
    }
                }
            }
        }
    }
    @IBAction func pressThree(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/planets/1/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
            let dictionary: [String: Any]? = json as? [String: Any]
            if let dictionary = dictionary {
            let name: String? = dictionary["name"] as? String
            if let name = name {
            label.text = name
    }
                }
            }
        }
    }
    @IBAction func Press2One(_ sender: Any) {
         let url: URL = URL(string: "https://swapi.co/api/planets/4/")!
            let responseData: Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                let name: String? = dictionary["name"] as? String
                if let name = name {
                label.text = name
        }
                    }
                }
            }
    }
    @IBAction func Press2Two(_ sender: Any) {
         let url: URL = URL(string: "https://swapi.co/api/planets/5/")!
            let responseData: Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                let name: String? = dictionary["name"] as? String
                if let name = name {
                label.text = name
        }
                    }
                }
            }
    }
    @IBAction func Press2Three(_ sender: Any) {
         let url: URL = URL(string: "https://swapi.co/api/planets/27/")!
            let responseData: Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                let name: String? = dictionary["name"] as? String
                if let name = name {
                label.text = name
        }
                    }
                }
            }
    }
    @IBAction func Press3One(_ sender: Any) {
         let url: URL = URL(string: "https://swapi.co/api/planets/7/")!
            let responseData: Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                let name: String? = dictionary["name"] as? String
                if let name = name {
                label.text = name
        }
                    }
                }
            }
    }
    @IBAction func Press3Two(_ sender: Any) {
         let url: URL = URL(string: "https://swapi.co/api/planets/8/")!
            let responseData: Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                let name: String? = dictionary["name"] as? String
                if let name = name {
                label.text = name
        }
                    }
                }
            }
    }
    @IBAction func Press3Three(_ sender: Any) {
         let url: URL = URL(string: "https://swapi.co/api/planets/9/")!
            let responseData: Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                let name: String? = dictionary["name"] as? String
                if let name = name {
                label.text = name
        }
                    }
                }
            }
    }
}

