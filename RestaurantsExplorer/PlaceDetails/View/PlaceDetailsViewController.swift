//
//  PlaceDetailsViewController.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import UIKit

class PlaceDetailsViewController: UIViewController {
    
    @IBOutlet weak var photo: UIImageView!
    private let viewModel = PlaceDetailsViewModel()
    private let imageLoader = ImageLoader()
    
    var flag = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageLoader.loadImage { data in
            
            DispatchQueue.main.async {
                self.photo.image = data.image
            }

        }
        viewModel.search { result in
            print(result.name)
            
//            DispatchQueue.main.async {
//                self.photo.image = UIImage(systemName: "gear")
//            }
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("details disappear")
    }

}
