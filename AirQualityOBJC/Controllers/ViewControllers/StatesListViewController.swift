//
//  StatesListViewController.swift
//  AirQualityOBJC
//
//  Created by Mathias on 6/24/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import UIKit

class StatesListViewController: UIViewController {
    
    var country: String?
    var states: [String] = [] {
        didSet {
            updateTableViews()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            guard let country = country else {return}
            DMCCityAirQualityController.fetchSupportedStates(inCountry: country) { (states) in
                if let states = states {
                    self.states = states
                }
            }
        }
        

        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toCitiesVC" {
                
                guard let indexPath = tableView.indexPathForSelectedRow else {return}
                guard let destinationVC = segue.destination as? CitiesListViewController else {return}
                
                let stateToSend = states[indexPath.row]
                
                guard let country = country else {return}
                destinationVC.country = country
                destinationVC.state = stateToSend
            }
        }
        
        func updateTableViews() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }

    extension StatesListViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            states.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
            let indexPath = states[indexPath.row]
            cell.textLabel?.text = indexPath
            return cell
        }
        
    }
