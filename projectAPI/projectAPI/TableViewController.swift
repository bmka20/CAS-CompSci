//
//  TableViewController.swift
//  projectAPI
//
//  Created by Brandon Adiele on 12/18/19.
//  Copyright © 2019 Brandon Adiele. All rights reserved.
//

import UIKit

class HolidaysTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var listOfHolidays = [HolidayDe]() {
        
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listOfHolidays.count) Holidays found"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfHolidays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let holiday = listOfHolidays[indexPath.row]
        cell.textLabel?.text = holiday.name
        cell.detailTextLabel?.text = holiday.date.iso
        
        return cell
    }


}

extension HolidaysTableViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchBarText = searchBar.text else {
            print("Bruh")
            return
        }
        let holidayRequest = HolidayRequest(countryCode: searchBarText)
        holidayRequest.getSomeHolidays {[weak self] result in
            switch result {
            case .failure(let error): print(error)
            case .success(let holidays):
            self?.listOfHolidays = holidays
            }
        }
        
    }
    
}

//This app is able to find the holidays celebrated in countries across the world. There's a search bar and in order to search up a country you must use their iso code: "https://calendarific.com/supported-countries" It will then fill the cells of the table view with the name of the country corresponding to the iso code, and it will also give the day it's celebrated as of 2019(I defined that in the getTheHoliday swift file).
