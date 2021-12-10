//
//  PlaceDetailsViewController.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import UIKit

class PlaceDetailsViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    
    private let viewModel = PlaceDetailsViewModel()
    var id = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.search(id: self.id) { loader in
            loader.loadImage(url: self.viewModel.photoURL) {
                DispatchQueue.main.async { [unowned self] in
                    nameLabel.text = viewModel.name
                    descriptionLabel.text = viewModel.description
                    locationLabel.text = viewModel.location
                    telephoneLabel.text = "tel: " + viewModel.telephone
                    photoImageView.image = viewModel.image
                    photoImageView.setNeedsDisplay()
                }
            }
        }
        
//        viewModel.imageLoader.loadImage(url: self.viewModel.photoURL) { [unowned self] in
//            viewModel.search(id: self.id) { [unowned self] data in
//                DispatchQueue.main.async {
//                    nameLabel.text = viewModel.name
//                    descriptionLabel.text = viewModel.description
//                    locationLabel.text = viewModel.location
//                    telephoneLabel.text = "tel: " + viewModel.telephone
//                }
//            }
//            viewModel.search(id: self.id) { [unowned self] _ in
//                DispatchQueue.main.async {
//                    self.photoImageView.image = viewModel.image
//                }
//            }
//        }
            
//            data.imageLoader.loadImage(url: "https://fastly.4sqi.net/img/general/200x200/141382557_pfzSn9GPxJkAHE-IF6L0SILXcXoN95IAau22s7g-n3Q.jpg") { [unowned self] photo in
//                DispatchQueue.main.async {
//                    self.photoImageView.image = photo.image
//                }
//                data.image = photo.image
//            }
//
//            DispatchQueue.main.async {
//                nameLabel.text = data.name //viewModel.name
//                descriptionLabel.text = data.description // viewModel.description
//                locationLabel.text = data.location // viewModel.location
//                telephoneLabel.text = "tel: " + data.telephone // viewModel.telephone
//                photoImageView.image = data.image // viewModel.image
//                self.photoImageView.setNeedsDisplay()
//                self.view.layoutSubviews()
//            }
//        }
//        viewModel.imageLoader.loadImage(url: self.viewModel.photoURL) { [unowned self] _ in
//            print("start")
//            DispatchQueue.main.async {
//                photoImageView.image = viewModel.imageLoader.image
//                print("image")
//            }
//        }
    }
    
//    private func updateView(com: @escaping (PlaceDetailsViewController) -> ()) {
//        viewModel.search(id: self.id) { [unowned self] data in
//            DispatchQueue.main.async {
//                nameLabel.text = viewModel.name
//                descriptionLabel.text = viewModel.description
//                locationLabel.text = viewModel.location
//                telephoneLabel.text = "tel: " + viewModel.telephone
//                print("search")
//            }
//        }
//    }
    
    private func up(search: (()), com: @escaping () -> ()) {
        DispatchQueue.main.async { [unowned self] in
            nameLabel.text = viewModel.name
            descriptionLabel.text = viewModel.description
            locationLabel.text = viewModel.location
            telephoneLabel.text = "tel: " + viewModel.telephone
            print("search")
        }
        print("i knew it")
        com()
    }

}
