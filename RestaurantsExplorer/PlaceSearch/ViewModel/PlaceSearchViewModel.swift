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
    
    func search(city: String, filter: String = Filter.all.rawValue, com: @escaping ([Result]) -> ()) {
        
        nameList.removeAll()
        categoryList.removeAll()
        locationList.removeAll()
        //MARK: - JSON Parsing

        let headers = [
          "Accept": "application/json",
          "Authorization": "fsq3hRqQ7Bdp6hABZmEHSki+HEZfhTSgGAalL/xO3OtvAl4="
        ]
        let city = (city == "") ? "Kyiv" : city
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/search?categories=" + filter + "&near=" + city + "&limit=5")! as URL,
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
                let result = try JSONDecoder().decode(PlaceSearchModel.self, from: data)
                for i in 0..<result.results.count {
                    print(result.results[i].name)
                    
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
