//
//  ViewController.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import UIKit

class PlaceSearhViewController: UIViewController {
    
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var filter: UISegmentedControl!
    
    @IBAction func filterSearch(_ sender: UISegmentedControl) {
        var currentfilter: Filter
        switch sender.selectedSegmentIndex {
            case 1: currentfilter = .fastFood
            case 2: currentfilter = .asian
            case 3: currentfilter = .italian
            case 4: currentfilter = .ukrainian
            default: currentfilter = .all
        }
        updateView(city: city.text, filter: currentfilter.rawValue)
    }
    
    @IBAction func searchByCity(_ sender: UITextField) {
        guard let city = sender.text else { return }
        guard let filter = filter.titleForSegment(at: filter.selectedSegmentIndex) else { return }
        viewModel.search(city: city, filter: filter ) {_ in
            
        }
    }
    
    @IBOutlet weak var restaurantTable: UITableView!
    
    private let viewModel = PlaceSearchViewModel()
    private var nameList = [String]()
    private var categoryList = [String]()
    private var locationList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView(city: city.text, filter: Filter.all.rawValue)
    }
    
    func updateView (city: String?, filter: String) {
        guard let city = city else { return }
        viewModel.search(city: city, filter: filter) { [unowned self] _ in
            nameList = viewModel.nameList
            categoryList = viewModel.categoryList
            locationList = viewModel.locationList
            DispatchQueue.main.async {
                restaurantTable.reloadData()
            }
        }
    }
}

extension PlaceSearhViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
        cell.nameLabel.text = self.nameList[indexPath.row]
        cell.categoryLabel.text = self.categoryList[indexPath.row]
        cell.locationLabel.text = self.locationList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected.toggle()
        navigationController?.pushViewController(PlaceDetailsViewController(), animated: true)
    }
    
}

