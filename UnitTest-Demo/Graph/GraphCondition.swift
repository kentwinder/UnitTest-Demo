//
//  GraphCondition.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 3/28/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation
import Gloss

struct GraphCondition: Decodable {
    
    let text: String?
    let icon: String?
    let code: Int?
    
    init?(json: JSON) {
        self.text = "text" <~~ json
        self.icon = "icon" <~~ json
        self.code = "code" <~~ json
    }
}
