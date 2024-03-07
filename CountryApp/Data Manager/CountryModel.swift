//
//  CountryModel.swift
//  CountryApp
//
//  Created by Ziyadkhan on 05.03.24.
//

import Foundation

struct CountryModel {
    var name: String
    var flag: String
    var cities: [City]
}

struct City {
    var name: String
    var image: String
    var info: String
}
