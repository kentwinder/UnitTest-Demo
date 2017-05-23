//
//  GraphCurrentWeatherResponse.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 3/28/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation

class GraphCurrentWeatherResponse: NSObject {
    var location: GraphLocation?
    var current: GraphCurrent?
    
    init(withDictionary dict: AnyObject) {
        if let dict = dict as? [String: AnyObject] {
            if let location = dict["location"] {
                self.location = GraphLocation(withDictionary: location)
            }
            
            if let current = dict["current"] {
                self.current = GraphCurrent(withDictionary: current)
            }
        }
    }
}
