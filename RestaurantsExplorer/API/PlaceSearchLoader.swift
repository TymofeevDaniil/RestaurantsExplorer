//
//  PlaceSearch+GET.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import Foundation

class PlaceSearchLoader {
    
    func search(city: String = "Kyiv", filters: [Int] = [13065]){

        let headers = [
          "Accept": "application/json",
          "Authorization": "fsq3hRqQ7Bdp6hABZmEHSki+HEZfhTSgGAalL/xO3OtvAl4="
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/search?categories=13065%2C13066%2C13200&near=Kyiv&limit=50")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            DispatchQueue.main.async {
                print(type(of: data))
            }
          if (error != nil) {
            print("error found")
          } else {
            let httpResponse = response as? HTTPURLResponse
//            print(httpResponse)
          }
        })

        dataTask.resume()
    }
}
