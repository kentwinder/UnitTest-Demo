//
//  Constants.swift
//  UnitTest-Demo
//
//  Created by Kakashi on 05/15/2017.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation

struct Constants {
    static let apiUrl = "https://api.apixu.com/v1/current.json?key=16ad4c6f03b54a9f9f284720172803&q="
    
    static func apiUrl(forCity city: String) -> String {
        return "\(apiUrl)\(city)"
    }
    
    struct httpStatusCode {
        static let success = 200
        static let error404 = 404
        static let error500 = 500
    }
}
