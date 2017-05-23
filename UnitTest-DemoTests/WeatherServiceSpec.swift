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

class WeatherServiceSpec: QuickSpec {
    
    override func spec() {
        describe("WeatherService") {
            let city = "Bangkok"
            var url: String?
            
            describe("getCurrentWeather") {
                
                beforeEach {
                    super.setUp()
                    
                    url = Constants.apiUrl(forCity: city)
                    let path = Bundle(for: type(of: self)).path(forResource: "BangkokCurrentWeather", ofType: "json")!
                    let data = NSData(contentsOfFile: path)!
                    MockingjayProtocol.addStub(matcher: uri(url!), builder: jsonData(data as Data))
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
                    
                    it("should contain details for current weather in Bangkok") {
                        expect(successResponse).toEventuallyNot(beNil())
                    }
                }
            }
        }
    }
}
