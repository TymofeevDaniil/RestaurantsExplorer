//
//  ViewController.swift
//  RestaurantsExplorer
//
//  Created by Danil Tymofeev on 06.12.2021.
//

import UIKit

class PlaceSearhViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    @IBOutlet weak var restaurantTable: UITableView!
    
    @IBAction func filterSearch(_ sender: UISegmentedControl) {
        updateView(city: cityTextField.text, filter: currentFilter())
    }
    
    @IBAction func searchButton(_ sender: Any) {
        updateView(city: cityTextField.text, filter: currentFilter())
    }
    
    private let viewModel = PlaceSearchViewModel()
    private var nameList = [String]()
    private var categoryList = [String]()
    private var locationList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView(city: cityTextField.text, filter: Filter.all.rawValue)
    }
    
    private func updateView (city: String?, filter: String) {
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
    
    private func currentFilter() -> String {
        let currentfilter: Filter
        switch filterSegmentedControl.selectedSegmentIndex {
            case 1: currentfilter = .fastFood
            case 2: currentfilter = .asian
            case 3: currentfilter = .italian
            case 4: currentfilter = .ukrainian
            default: currentfilter = .all
        }
        return currentfilter.rawValue
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
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Details") as? PlaceDetailsViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.id = viewModel.idList[indexPath.row]
            print(vc.id)
        }
    }
    
}

