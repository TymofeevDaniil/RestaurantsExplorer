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
    
    func loadImage(url: String?, com: @escaping () -> ()) {
        if url == nil {
            //i can use forse umwrap here
            let noImage = UIImage(systemName: "gear")!
            image = noImage
            print("no url")
        } else {
            print("    " + url!)
            let dataTask = URLSession.shared.dataTask(
                with: URL(string:url!)!) { data, response, error in
                    if error != nil {
                        print("url error")
                        return
                    }
                    guard let data = data, let image = UIImage(data: data)  else { print("no data"); return }
                    self.image = image
                    com()
            }
            dataTask.resume()
        }
//        com()
    }
}
