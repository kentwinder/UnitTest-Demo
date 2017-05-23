//
//  ViewControllerSpec.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 4/1/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

@testable import UnitTest_Demo

import Quick
import Nimble

class ViewControllerSpec: QuickSpec {
    
    override func spec() {
        var viewController: ViewController!
        var weatherService: FakeWeatherService!
        
        beforeEach {
            weatherService = FakeWeatherService()
            
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            viewController = storyboard.instantiateViewController(withIdentifier: ViewController.Identifier) as! ViewController
            viewController.weatherService = weatherService
            UIApplication.shared.keyWindow!.rootViewController = viewController
            
            expect(viewController.view).notTo(beNil())
        }
        
        it("should not display any information") {
            expect(viewController.cityLabel.text).to(equal(""))
            expect(viewController.conditionLabel.text).to(equal(""))
            expect(viewController.temperatureLabel.text).to(equal(""))
            expect(viewController.imageView.image).to(beNil())
            expect(viewController.detailsLabel.text).to(equal(""))
        }
        
        it("should has the correct title for button refresh") {
            expect(viewController.refreshButton.titleLabel?.text).to(equal("Refresh"))
        }
        
        it("make a request to get current weather details") {
            expect(weatherService.getCurrentWeatherCalled).to(beTrue())
        }

        describe("tapping the refresh button") {
            beforeEach {
                weatherService.getCurrentWeatherCalled = false
                viewController.refreshButton.sendActions(for: .touchUpInside)
            }
            
            it("make a request to get current weather details") {
                expect(weatherService.getCurrentWeatherCalled).to(beTrue())
            }
        }
    }
}
