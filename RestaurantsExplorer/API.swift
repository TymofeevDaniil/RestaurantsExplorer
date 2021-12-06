//
//  API.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import Foundation

struct API {
    
    func doIT() {

        let headers = ["Accept": "application/json"]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v2/venues/search?query=sushi&limit=3")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error)
          } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
          }
        })

        dataTask.resume()
    }

}
