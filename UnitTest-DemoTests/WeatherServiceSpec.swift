//
//  WeatherServiceSpec.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 3/31/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

@testable import UnitTest_Demo

import Quick
import Nimble
import Mockingjay
import Alamofire
import Gloss

class WeatherServiceSpec: QuickSpec {
    
    override func spec() {
        describe("WeatherService") {
            let service = WeatherService()
            let city = "Bangkok"
            var url: String?
            
            describe("getCurrentWeather") {
                
                beforeEach {
                    super.setUp()
                    
                    url = "\(service.apiUrl)\(city)"
                    
                    let path = Bundle(for: type(of: self)).path(forResource: "BangkokCurrentWeather", ofType: "json")!
                    let data = NSData(contentsOfFile: path)!
                    self.stub(uri(url!), jsonData(data as Data))
                }
                
                context("success") {
                    var successResponse : GraphCurrentWeatherResponse?
                    
                    beforeEach {
                        successResponse = nil
                        WeatherService().getCurrentWeather(city: city, completion: { (response) in
                            successResponse = response
                        }, failure: { (error) in
                            //
                        })
                    }
                    
                    it("last updated time should be 2017-03-31 17:00") {
                        expect(successResponse?.current?.lastUpdated).toEventually(equal("2017-03-31 17:00"))
                    }
                }
            }
        }
    }
}
