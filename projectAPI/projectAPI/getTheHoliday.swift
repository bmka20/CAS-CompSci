//
//  File.swift
//  projectAPI
//
//  Created by Brandon Adiele on 12/18/19.
//  Copyright © 2019 Brandon Adiele. All rights reserved.
//

import Foundation


enum HolidayError: Error{
    case noDataAvailable
    case canNotProcessData
}


struct HolidayRequest {
    
var resourceURL: URL
    
let API_KEY = "94ffa6444ff25d17d5e7b2bd66e279b564ef2fb9"
    
    init(countryCode : String) {
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat  = "2019"
        let currentYear = format.string(from: date)
        
        let destinationURL = "https://calendarific.com/api/v2/holidays?&api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
        
        guard let resourceURL = URL(string: destinationURL) else {fatalError()}
        
        self.resourceURL = resourceURL
        
    }


    func getSomeHolidays (compleation: @escaping(Result<[HolidayDe], HolidayError>) ->Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in

            guard let jsonData = data else {
                compleation(.failure(.noDataAvailable))
                return
            }

            do{
                let decoder = JSONDecoder()
                let holidaysResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                let holidayDetails = holidaysResponse.response.holidays
                compleation(.success(holidayDetails))
            }catch{
                compleation(.failure(.canNotProcessData))
            }

        }
        dataTask.resume()
    }
}
