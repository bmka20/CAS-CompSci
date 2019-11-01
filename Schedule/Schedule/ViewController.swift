//
//  ViewController.swift
//  Schedule
//
//  Created by Brandon Adiele on 10/23/19.
//  Copyright © 2019 Brandon Adiele. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return dayType.count
        }
        else if component == 1{
            return weekday.count
        }
        else {
            return schedule.count
        }
    }
    
    
    var theDay = "A"
    var theWeekday = "Monday"
    var theSchedule = "Normal"
    
    let dayType = ["A", "C", "B"]
    let weekday = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    let schedule = ["Normal", "Double", "Assembly"]
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return dayType[row]
        }
        else if component == 1{
            return weekday[row]
        }
        else {
            return schedule[row]
        }
    }
    
    var curWeekday:String = " "
    var curDayType:String = " "
    
    let mySchedule:[String:String] = [
        "A": "CAS Physics",
        "B": "CAS Computer Science",
        "C": "CAS History",
        "D": "English-4 Horror",
        "E": "Calculus",
        "F": "Free",
        "M/W": "Double Free",
        "TUE/FRI": "CAS Filmmaking",
        "TH": "Life Skills"
    ]
    
    
    
    @IBAction func getSchedule(_ sender: Any) {
        let dayTypeRow = pickerView.selectedRow(inComponent: 0)
        let ACBDay = dayType[dayTypeRow]
        let weekDayRow = pickerView.selectedRow(inComponent: 1)
        let weekType = weekday[weekDayRow]
 
        let periodRotation:[String:[String:[String]]] = [
            "A":[
                "Monday": ["A", "B", "D", "E", "M/W"],
                "Tuesday": ["A", "B", "D", "E", "TUE/FRI"],
                "Wednesday": ["A", "B", "D", "E", "M/W"],
                "Thursday": ["A", "B", "D", "E", "TH"],
                "Friday": ["A", "B", "D", "E", "TUE/FRI"],
                ],
            "C":[
                "Monday": ["C", "A", "F", "D", "M/W"],
                "Tuesday": ["C", "A", "F", "D", "TUE/FRI"],
                "Wednesday": ["C", "A", "F", "D", "M/W"],
                "Thursday": ["C", "A", "F", "D", "TH"],
                "Friday": ["C", "A", "F", "D", "TUE/FRI"],
               ],
            "B":[
                "Monday": ["B", "C", "E", "F", "M/W"],
                "Tuesday": ["B", "C", "E", "F", "TUE/FRI"],
                "Wednesday": ["B", "C", "E", "F", "M/W"],
                "Thursday": ["B", "C", "E", "F", "TH"],
                "Friday": ["B", "C", "E", "F", "TUE/FRI"],
        ]
    ]
        
        let mySche = getScheduleForDay(periods: periodRotation[ACBDay]![weekType]!, mySchedule: mySchedule)
        label.text = mySche
    }
    
    
    
    func getScheduleForDay(periods:[String], mySchedule:[String:String]) -> String {
        var output = ""
        for period in periods{
            output += "\(period) - "
            output += mySchedule[period] ?? "Free Period"
            output += "\n"
    }
        return output
 
 }
}

