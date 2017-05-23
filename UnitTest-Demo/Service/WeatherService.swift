//
//  WeatherService.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 3/28/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation

protocol WeatherServiceProtocol {
    
    func getCurrentWeather(city: String, completion: @escaping (_ currentWeather: GraphCurrentWeatherResponse) -> (), failure: @escaping (_ error: Error) -> ())
    
}

public class WeatherService: WeatherServiceProtocol {
    
    func getCurrentWeather(city: String, completion: @escaping (_ currentWeather: GraphCurrentWeatherResponse) -> (), failure: @escaping (_ error: Error) -> ()) {
        let url = Constants.apiUrl(forCity: city)
        let requestURL = URL(string: url)!
        let urlRequest = URLRequest(url: requestURL)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) -> Void in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if statusCode == Constants.httpStatusCode.success {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    let weatherResponse = GraphCurrentWeatherResponse.init(withDictionary: json)
                    completion(weatherResponse)
                } catch {
                    failure(error)
                }
            }
        }
        task.resume()
    }
    
}
