//
//  TableViewController.swift
//  JSONWritingProject
//
//  Created by Brandon Adiele on 1/20/20.
//  Copyright © 2020 Brandon Adiele. All rights reserved.
//

import UIKit

/*
let songs = ["Hot (feat. Gunna)", "Mo Bamba", "SICKO MODE", "$$$", "Dark Knight Dummo (feat. Travis Scott)", "Shoota (feat. Lil Uzi Vert)"]
*/

let saver = UserDefaults(suiteName: "saveMySongs") //

class TableViewController: UITableViewController {
   
    @IBOutlet var songTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSongs()
        
        navigationItem.title = "My Playlist"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
       
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getSongs()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        saveSongURL()
    }
    
    
    
    var newSongs = [String]()

    @IBAction func addSongsButton(_ sender: Any) {
        let popUp = UIAlertController(title: "Add Song", message: nil, preferredStyle: .alert)
        popUp.addTextField { (songsTF) in
            songsTF.placeholder = "Enter Song"
        }
        let songAdd = UIAlertAction(title: "Add", style: .default) { (Void) in
            guard let newSong = popUp.textFields?.first?.text else { return }
            print(newSong)
            self.newSongs.append(newSong)
            self.songTableView.reloadData()
        }
        popUp.addAction(songAdd)
        present(popUp, animated: true)
        saveSongURL()
    }
    // MARK: - Table view data source

    @IBAction func sortButton(_ sender: Any) {
         newSongs.sort(by: {$0 < $1})
        songTableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newSongs.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            newSongs.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            saveSongURL()
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = newSongs[indexPath.row]
        

        return cell
    }
    
    
    func saveSongURL() {
        saver?.set(newSongs, forKey: "savedSong")
        saver?.synchronize()
        //I might not need the line above. Apple doesn't advise using the synchronize method to force save the data
    }
    
    func getSongs() {
        let songData = saver?.value(forKeyPath: "savedSong")
        if songData != nil {
             newSongs = songData as! [String]
        }
    }
    
    /*
    var sortSongs = newSongs.sorted { (str1, str2) -> Bool in
        return str1.count > str2.count
    }
  */
    
}
