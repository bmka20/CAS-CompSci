//
//  ViewController.swift
//  notesApp
//
//  Created by Brandon Adiele on 11/15/19.
//  Copyright © 2019 Brandon Adiele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var note:Note?
    @IBOutlet weak var notesText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        notesText.text = note?.note

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        note?.note = notesText.text
    }
    //@IBAction func notesButton(_ sender: Any) {
    //}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
