//
//  GraphLocation.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 3/28/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation
import Gloss

struct GraphLocation: Decodable {
    
    let name: String?
    let country: String?
    let localTime: String?
    
    init?(json: JSON) {
        self.name = "name" <~~ json
        self.country = "country" <~~ json
        self.localTime = "localtime" <~~ json
    }
}
