//
//  PlaceSearchViewModel.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import Foundation

class PlaceSearchViewModel {
    
    var nameList = [String]()
    var locationList = [String]()
    var categoryList = [String]()
    
    func search(city: String = "Kyiv", filters: [Int] = [13065], com: @escaping ([Result]) -> ()) {
        
        //MARK: - Filters set up (else default values)
        
//        let filter: String = ""
//        let city = city
        
        //MARK: - JSON Parsing

        let headers = [
          "Accept": "application/json",
          "Authorization": "fsq3hRqQ7Bdp6hABZmEHSki+HEZfhTSgGAalL/xO3OtvAl4="
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/search?categories=13065%2C13066%2C13200&near=Kyiv&limit=3")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            

            if (error != nil) {
                print("error found")
                return
            }
            do {
                guard let data = data else { return }
                let result = try JSONDecoder().decode(PlaceSearch.self, from: data)
                for i in 0..<result.results.count {
                    self.nameList.append(result.results[i].name)
                    self.categoryList.append(result.results[i].categories[0].name)
                    self.locationList.append(result.results[i].location.address)
                }
                com(result.results)
            }
            catch {}
        })
        dataTask.resume()
    }
    
}
