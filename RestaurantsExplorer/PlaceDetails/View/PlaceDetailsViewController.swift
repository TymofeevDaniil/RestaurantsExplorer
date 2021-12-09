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
    var flag = false { didSet {
        self.updateView()
    }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel.search(id: self.id) { [unowned self] data in
            DispatchQueue.main.async {
                nameLabel.text = viewModel.name
                descriptionLabel.text = viewModel.description
                locationLabel.text = viewModel.location
                telephoneLabel.text = "tel: " + viewModel.telephone
                print("search")
                flag.toggle()
            }
        }
//        viewModel.imageLoader.loadImage(url: self.viewModel.photoURL) { [unowned self] _ in
//            print("start")
//            DispatchQueue.main.async {
//                photoImageView.image = viewModel.imageLoader.image
//                print("image")
//            }
//        }
    }
    
    private func updateView() {
        print(viewModel.photoURL)
        viewModel.imageLoader.loadImage(url: self.viewModel.photoURL) { [unowned self] _ in
            print("start")
            DispatchQueue.main.async {
                photoImageView.image = viewModel.imageLoader.image
                photoImageView.setNeedsLayout()
                photoImageView.setNeedsDisplay()
                print("image")
            }
        }
    }

}
