//
//  CitiesListViewController.swift
//  AirQualityOBJC
//
//  Created by Mathias on 6/24/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {
    
    var country: String?
    var state: String?
    var cities: [String] = [] {
        didSet {
            updateTableViews()
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "toCityDetailsVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            guard let country = country else {return}
            guard let state = state else {return}
            guard let destinationVC = segue.destination as? CityDetailViewController else { return }
              
              let cityToSend = cities[indexPath.row]
              destinationVC.city = cityToSend
              destinationVC.state = state
              destinationVC.country = country
          }
    }
    
    func updateTableViews() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension CitiesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        let indexPath = cities[indexPath.row]
        cell.textLabel?.text = indexPath
        return cell
    }
}
