//
//  GraphCurrentWeatherResponse.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 3/28/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation
import Gloss

struct GraphCurrentWeatherResponse: Decodable {
    
    let location: GraphLocation?
    let current: GraphCurrent?
    
    init?(json: JSON) {
        self.location = "location" <~~ json
        self.current = "current" <~~ json
    }
}
