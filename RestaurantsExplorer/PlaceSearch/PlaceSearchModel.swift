//
//  PlaceSearchModel.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import Foundation

struct PlaceSearchModel: Decodable {
    
    let results : [Result]?
    
    let json = """
{
  "results": [
    {
      "fsq_id": "57cd6314498ec0379b52ebec",
      "categories": [
        {
          "id": 13288,
          "name": "Kebab Restaurant",
          "icon": {
            "prefix": "https://ss3.4sqi.net/img/categories_v2/food/middleeastern_",
            "suffix": ".png"
          }
        }
      ],
      "chains": [],
      "distance": 2300,
      "geocodes": {
        "main": {
          "latitude": 50.42224043756747,
          "longitude": 30.517176118839718
        }
      },
      "location": {
        "address": "вул. Антоновича, 115",
        "country": "UA",
        "cross_street": "Владимиро Лыбедская",
        "locality": "Киев",
        "neighborhood": [
          "Голосеевский район"
        ],
        "postcode": "02000",
        "region": "г. Киев"
      },
      "name": "Кебаб Даш (Kebab Dash)",
      "related_places": {},
      "timezone": "Europe/Kiev"
    },
    {
      "fsq_id": "5aa968d7e1f0aa1412b2959b",
      "categories": [
        {
          "id": 13031,
          "name": "Burger Joint",
          "icon": {
            "prefix": "https://ss3.4sqi.net/img/categories_v2/food/burger_",
            "suffix": ".png"
          }
        }
      ],
      "chains": [],
      "distance": 3069,
      "geocodes": {
        "main": {
          "latitude": 50.42750854452616,
          "longitude": 30.50956964492798
        }
      },
      "location": {
        "address": "вул. Федорова, 31",
        "country": "UA",
        "cross_street": "",
        "locality": "Киев",
        "neighborhood": [
          "Батиєва гора"
        ],
        "postcode": "02000",
        "region": "г. Киев"
      },
      "name": "YIZHA food truck",
      "related_places": {},
      "timezone": "Europe/Kiev"
    }
  ]
}
"""
    func parse() {
        
        let data = json.data(using: .utf8)!
        let result: PlaceSearchModel = try! JSONDecoder().decode(PlaceSearchModel.self, from: data)
//        print("\(result.count)")
//        print(result.results?.first?.name)
        for i in 0..<result.results!.count {
            print(result.results![i].name)
        }
//        print(result.results)
    }
    
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
