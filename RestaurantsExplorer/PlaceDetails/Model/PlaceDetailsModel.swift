//
//  PlaceDetailsModel.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import Foundation

struct PlaceDetailsModel: Decodable {
    
    let location: LocationDetails
    let name: String
    let photos: [Photo]
    let tel: String
}

struct LocationDetails: Decodable {
    
    let address: String
    
}

struct Photo: Decodable {
    
    let prefix: String
    let suffix: String
    
}

