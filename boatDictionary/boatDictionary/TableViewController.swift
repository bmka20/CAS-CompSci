//
//  TableViewController.swift
//  boatDictionary
//
//  Created by Brandon Adiele on 11/8/19.
//  Copyright © 2019 Brandon Adiele. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    /*
    let boats:[String:String] = [
    "Kayak":"white, large, 0 dolphin power",
    "Monohull":"blue, medium, 960 dolphin power",
    "Yacht":"Pink, Large, 320 dolphin power",
    "Pirate Boat Ship":"Black, Extra Large, 200 dolphin power",
    "Raft":"brown, really small, 1/2 dolphin power",
    ]
*/
    let boats:[Boat] = [
        Boat(n: "Kayak", dp: 0, c: "white", s: "large"),
        Boat(n: "Monohull", dp: 960, c: "blue", s: "medium"),
        Boat(n: "Yacht", dp: 320, c: "Pink", s: "large"),
        Boat(n: "Pirate Boat Ship", dp: 200, c: "black", s: "extra large"),
        Boat(n: "Raft", dp: 1/2, c: "brown", s: "really small")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return boats.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "boat", for: indexPath)
        cell.textLabel?.text = boats[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        let indexPath = self.tableView.indexPathForSelectedRow
        
        let b = self.boats[indexPath!.row]
        vc.boat = b
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
