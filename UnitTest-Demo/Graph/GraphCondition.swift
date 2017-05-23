//
//  GraphCondition.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 3/28/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation

class GraphCondition: NSObject {
    var text: String?
    var icon: String?
    var code: Int?
    
    init(withDictionary dict: AnyObject) {
        if let dict = dict as? [String: AnyObject] {
            self.text = dict["text"] as? String
            self.icon = dict["icon"] as? String
            self.code = dict["code"] as? Int
        }
    }
}
