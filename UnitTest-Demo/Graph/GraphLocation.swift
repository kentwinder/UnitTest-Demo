//
//  GraphLocation.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 3/28/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation

class GraphLocation: NSObject {
    var name: String?
    var country: String?
    var localtime: String?
    
    init(withDictionary dict: AnyObject) {
        if let dict = dict as? [String: AnyObject] {
            self.name = dict["name"] as? String
            self.country = dict["country"] as? String
            self.localtime = dict["localtime"] as? String
        }
    }
}
