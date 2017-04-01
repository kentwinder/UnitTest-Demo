//
//  WeatherService.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 3/28/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation
import Alamofire
import Gloss

protocol WeatherServiceProtocol {
    func getCurrentWeather(city: String, completion: @escaping (_ currentWeather: GraphCurrentWeatherResponse) -> (), failure: @escaping (_ error: Error) -> ())
}

public class WeatherService: WeatherServiceProtocol {
    public let apiUrl = "https://api.apixu.com/v1/current.json?key=16ad4c6f03b54a9f9f284720172803&q="
    
    func getCurrentWeather(city: String, completion: @escaping (_ currentWeather: GraphCurrentWeatherResponse) -> (), failure: @escaping (_ error: Error) -> ()) {
        let url = "\(apiUrl)\(city)"
        
        request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .failure(let error):
                    failure(error)
                case .success:
                    guard let json = response.result.value as? JSON else {
                        return
                    }
                    
                    let weatherResponse = GraphCurrentWeatherResponse.init(json: json)
                    completion(weatherResponse!)
                }
        }
    }
}
