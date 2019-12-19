//
//  Holiday.swift
//  projectAPI
//
//  Created by Brandon Adiele on 12/18/19.
//  Copyright © 2019 Brandon Adiele. All rights reserved.
//

import Foundation

struct HolidayResponse: Decodable {
    var response: Holidays
}

struct Holidays: Decodable {
    var holidays: [HolidayDe]
}

struct HolidayDe: Decodable {
    var name: String
    var date: DateInformation
}

struct DateInformation: Decodable {
    var iso: String
}
