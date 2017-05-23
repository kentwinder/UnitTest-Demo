//
//  GraphCurrent.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 3/28/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation

class GraphCurrent: NSObject {
    var lastUpdated: String?
    var temperature: Double?
    var condition: GraphCondition?
    var windSpeed: Double?
    var precipitation: Double?
    var pressure: Double?
    var humidity: Double?
    var feelslike: Double?
    var visibility: Double?
    
    init(withDictionary dict: AnyObject) {
        if let dict = dict as? [String: AnyObject] {
            self.lastUpdated = dict["last_updated"] as? String
            self.temperature = dict["temp_c"] as? Double
            if let condition = dict["condition"] {
                self.condition = GraphCondition(withDictionary: condition)
            }
            self.windSpeed = dict["wind_kph"] as? Double
            self.precipitation = dict["precip_mm"] as? Double
            self.pressure = dict["pressure_mb"] as? Double
            self.humidity = dict["humidity"] as? Double
            self.feelslike = dict["feelslike_c"] as? Double
            self.visibility = dict["vis_km"] as? Double
        }
    }
}
