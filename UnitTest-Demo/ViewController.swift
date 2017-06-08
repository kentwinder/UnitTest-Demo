//
//  ViewController.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 3/28/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    public static let Identifier = "ViewControllerIdentifier"

    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var weatherService: WeatherServiceProtocol = WeatherService()
    var imageService: ImageServiceProtocol = ImageService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentWeather()
    }
    
    @IBAction func refreshData(_ sender: Any) {
        getCurrentWeather()
    }
    
    func getCurrentWeather() {
        weatherService.getCurrentWeather(city: "Bangkok", completion: { [weak self] response in
            DispatchQueue.main.async(){
                self?.showCurrentWeatherDetails(data: response)
            }
        }) { error in
            debugPrint("Error: \(error.localizedDescription)")
        }
    }
    
    func showCurrentWeatherDetails(data: GraphCurrentWeatherResponse) {
        self.cityLabel.text = data.location?.name
        self.conditionLabel.text = data.current?.condition?.text
        if let temperature = data.current?.temperature {
            self.temperatureLabel.text = "\(temperature)°"
        }
        if let iconUrl = data.current?.condition?.icon, !iconUrl.isEmpty {
            imageService.downloadImage(fromUrl: "https:\(iconUrl)", completion: { [weak self] (image) in
                DispatchQueue.main.async() {
                    self?.imageView.image = image
                }
            }, failure: { (errorMessage) in
                debugPrint("Can not download image, error: \(errorMessage)")
            })
        }
        
        var details = ""
        if let lastUpdated = data.current?.lastUpdated {
            details.append("Last update: \(lastUpdated)\n")
        }
        if let humidity = data.current?.humidity {
            details.append("Humidity: \(humidity)%\n\n")
        }
        
        if let windSpeed = data.current?.windSpeed {
            details.append("Wind: \(windSpeed) kph\n")
        }
        if let feelslike = data.current?.feelslike {
            details.append("Feels Like: \(feelslike)°\n\n")
        }
        
        if let precipitation = data.current?.precipitation {
            details.append("Precipitation: \(precipitation) cm\n")
        }
        if let pressure = data.current?.pressure {
            details.append("Pressure: \(pressure) hPa\n\n")
        }
        
        if let visibility = data.current?.visibility {
            details.append("Visibility: \(visibility) km\n")
        }
        self.detailsLabel.text = details
    }
}

