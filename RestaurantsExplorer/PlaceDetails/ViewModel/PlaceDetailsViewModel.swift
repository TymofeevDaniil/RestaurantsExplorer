//
//  PlaceDetailsViewModel.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import Foundation

class PlaceDetailsViewModel {
    
    var name = String()
    var telephone = String()
    var location = String()
    var photoURL = String()
    
    
    func search(com: @escaping (PlaceDetailsModel) -> ()) {
        let headers = [
          "Accept": "application/json",
          "Authorization": "fsq3hRqQ7Bdp6hABZmEHSki+HEZfhTSgGAalL/xO3OtvAl4="
        ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/4e0d71fafa76d62f443f0164?fields=name%2Clocation%2Ctel%2Cphotos")! as URL,
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
                self.name = result.name
                self.telephone = result.tel
                self.location = result.location.address
                if let photo = result.photos.first {
                    self.photoURL = photo.prefix + "original" + photo.suffix
                }
                
                com(result)
            }
            catch {
                print("erorr data")
            }
        })

        dataTask.resume()
    }
    
    func loadPhoto(url: String) {
        
    }
}
