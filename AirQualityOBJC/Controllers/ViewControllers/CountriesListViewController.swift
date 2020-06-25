//
//  CountriesListViewController.swift
//  AirQualityOBJC
//
//  Created by Mathias on 6/24/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import UIKit

class CountriesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var countries: [String] = [] {
            didSet {
                updateTableView()
            }
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            DMCCityAirQualityController.fetchSupportedCountries { (countries) in
                if let countries = countries {
                    self.countries = countries
                }
            }
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toStateVC" {
                guard let indexPath = tableView.indexPathForSelectedRow else {return}
                guard let destinationVC = segue.destination as? StatesListViewController else {return}
                let countryToSend = countries[indexPath.row]
                destinationVC.country = countryToSend
            }
        }
        
        func updateTableView() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }

    extension CountriesListViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            countries.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
            let indexPath = countries[indexPath.row]
            cell.textLabel?.text = indexPath
            return cell
        }
        
    }
