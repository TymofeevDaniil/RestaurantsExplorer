//
//  ViewController.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import UIKit

class PlaceSearhViewController: UIViewController {
    
    @IBOutlet weak var restaurantTable: UITableView!
    
    
    private let viewModel = PlaceSearchViewModel()
    private var nameList = [String]()
    private var categoryList = [String]()
    private var locationList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        test.parse()
        viewModel.search(com: { [unowned self] _ in
            nameList = viewModel.nameList
            categoryList = viewModel.categoryList
            locationList = viewModel.locationList
            
        })

    }
    
    func updateView () {
        
    }


}

extension PlaceSearhViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

