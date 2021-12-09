//
//  ImageLoader.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 09.12.2021.
//

import Foundation
import UIKit

class ImageLoader {
    
    var image = UIImage()
    
    func loadImage(com: @escaping (ImageLoader) -> ()) {
        let dataTask = URLSession.shared.dataTask(
            with: URL(string:"https://fastly.4sqi.net/img/general/original/62121742_QLQ5yXinmM2QOPP0K9Hai3bxpzvShxXuRqPa9CMfyGA.jpg")!) { data, response, error in
                if error != nil {
                    print("data error")
                }
                guard let data = data, let image = UIImage(data: data)  else { print("no data"); return }
                self.image = image
        }
        dataTask.resume()
        com(self)
    }
}
