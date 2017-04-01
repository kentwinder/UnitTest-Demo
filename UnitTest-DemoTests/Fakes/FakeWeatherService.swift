//
//  FakeWeatherService.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 4/1/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation
@testable import UnitTest_Demo

class FakeWeatherService: WeatherServiceProtocol {
    var getCurrentWeatherCalled = false
    
    func getCurrentWeather(city: String, completion: @escaping (_ currentWeather: GraphCurrentWeatherResponse) -> (), failure: @escaping (_ error: Error) -> ()) {
        getCurrentWeatherCalled = true
    }
}
