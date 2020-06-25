//
//  CityDetailViewController.swift
//  AirQualityOBJC
//
//  Created by Mathias on 6/24/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    var country: String?
    var state: String?
    var city: String?
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var stateNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var aqiLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let city = city, let state = state, let country = country else {return}
        
        DMCCityAirQualityController.fetchData(forCity: city, state: state, country: country) { (city) in
            if let city = city {
                self.updateViews(info: city)
            }
        }
    }
    
    func updateViews(info: DMCCityAirQuality) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = info.city
            self.stateNameLabel.text = info.state
            self.countryNameLabel.text = info.country
            self.humidityLabel.text = "\(info.weather.humidity)"
            self.tempLabel.text = "\(info.weather.temperature)"
            self.windLabel.text = "\(info.weather.windSpeed)"
            self.aqiLabel.text = "\(info.pollution.airQualityIndex)"
        }
    }

}
