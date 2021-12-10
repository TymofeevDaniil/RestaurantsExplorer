//
//  PlaceDetailsViewModel.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import Foundation

class PlaceDetailsViewModel {
    
    var id = String()
    var name = String()
    var description = String()
    var telephone = String()
    var location = String()
    
    func search(id: String, com: @escaping () -> ()) {
        let headers = [
          "Accept": "application/json",
          "Authorization": "fsq3hRqQ7Bdp6hABZmEHSki+HEZfhTSgGAalL/xO3OtvAl4="
        ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/" + id + "?fields=name%2Clocation%2Cdescription%2Ctel%2Cphotos")! as URL,
            cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                print("error request")
            }
            do {
                guard let data = data else { return }
                let result = try JSONDecoder().decode(PlaceDetailsModel.self, from: data)
                let checkDetails: [String?] = [result.tel, result.location.address, result.description]
                let details = checkDetails.map{$0 ?? "N/A"}
                
                self.name = result.name
                self.telephone = details[0]
                self.location = details[1]
                self.description = details[2]
                com()
            }
            catch {
                print("erorr data")
            }
        })
        dataTask.resume()
    }
    
}
