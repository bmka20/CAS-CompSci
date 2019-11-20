//
//  TableViewController.swift
//  notesApp
//
//  Created by Brandon Adiele on 11/15/19.
//  Copyright © 2019 Brandon Adiele. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var notes:[Note] = [Note]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let note = Note()
        note.note = "Hello! This is a note to myself..."
        notes.append(note)
        let note2 = Note()
        note2.note = "What it do baby!"
        notes.append(note2)
        let note3 = Note()
        note3.note = "For real For real"
        notes.append(note3)
 }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections/ sections = grouping of rows (ex: section A, section B, etc.)
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returns the number of rows depending on the number of notes you have
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note", for: indexPath)
        let note = notes[indexPath.row]
        cell.textLabel?.text = "\(note.date)" + notes[indexPath.row].note
        //this func defines what goes into each cell.
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        if let indexPath = self.tableView.indexPathForSelectedRow{
        let n = self.notes[indexPath.row]
        //notes.textLabel?.text = "\(n.date)" + notes[indexPath.row].note
        vc.note = n
        //prepares to pass the data to the ViewController. data = the list of notes we wrote. "self.notes" code
    }
    else {
    let note = Note()
    notes.insert(note, at: 0)
    vc.note = note
    }
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
