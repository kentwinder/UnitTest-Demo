//
//  GraphCurrent.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 3/28/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation
import Gloss

struct GraphCurrent: Decodable {
    var lastUpdated: String?
    var temperature: Double?
    var condition: GraphCondition?
    var windSpeed: Double?
    var precipitation: Double?
    var pressure: Double?
    var humidity: Double?
    var feelslike: Double?
    var visibility: Double?
    
    init?(json: JSON) {
        self.lastUpdated = "last_updated" <~~ json
        self.temperature = "temp_c" <~~ json
        self.condition = "condition" <~~ json
        self.windSpeed = "wind_kph" <~~ json
        self.precipitation = "precip_mm" <~~ json
        self.pressure = "pressure_mb" <~~ json
        self.humidity = "humidity" <~~ json
        self.feelslike = "feelslike_c" <~~ json
        self.visibility = "vis_km" <~~ json
    }
}
