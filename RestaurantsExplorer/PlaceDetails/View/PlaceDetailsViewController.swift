//
//  PlaceDetailsViewController.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import UIKit

class PlaceDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    
    private let viewModel = PlaceDetailsViewModel()
    var id = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    private func updateView() {
        viewModel.search(id: self.id) {
            DispatchQueue.main.async { [unowned self] in
                nameLabel.text = viewModel.name
                descriptionLabel.text = viewModel.description
                locationLabel.text = viewModel.location
                telephoneLabel.text = "tel: " + viewModel.telephone
            }
        }
    }
    
}
