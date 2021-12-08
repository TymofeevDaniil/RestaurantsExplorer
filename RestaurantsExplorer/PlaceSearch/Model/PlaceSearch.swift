//
//  PlaceSearchModel.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import Foundation

struct PlaceSearch: Decodable {
    
    let results : [Result]

}

struct Result: Decodable {
    
    let categories: [Categories]
    let location: Location
    let name: String
    
}

struct Categories: Decodable {
    
    let id: Int
    let name: String
    
}

struct Location: Decodable {
    
    let address: String

}
