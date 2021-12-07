//
//  ViewController.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import UIKit

class PlaceSearhViewController: UIViewController {
    
    private let viewModel = PlaceSearchViewModel()
    private let dataLoader = PlaceSearchLoader()
    let test = PlaceSearchModel(results: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        test.parse()
    }


}

