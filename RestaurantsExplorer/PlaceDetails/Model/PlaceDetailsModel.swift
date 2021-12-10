//
//  PlaceDetailsModel.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import Foundation

struct PlaceDetailsModel: Decodable {
    
    let description: String?
    let location: LocationDetails
    let name: String
    let tel: String?
}

struct LocationDetails: Decodable {
    
    let address: String?
    
}
