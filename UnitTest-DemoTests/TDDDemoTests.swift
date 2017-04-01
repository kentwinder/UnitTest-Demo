//
//  TDDDemoTests.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 4/1/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation
import XCTest

@testable import UnitTest_Demo

class TDDDemoTests: XCTestCase {
    var tddDemo: TDDDemo!
    
    override func setUp() {
        super.setUp()
        tddDemo = TDDDemo()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test__input_is_1__ouput_is_1() {
        let output = tddDemo.fizzBuzz(input: 1)
        XCTAssertEqual(output, "1")
    }
    
    func test__input_is_3__ouput_is_Fizz() {
        let output = tddDemo.fizzBuzz(input: 3)
        XCTAssertEqual(output, "Fizz")
    }
    
    func test__input_is_5__output_is_Buzz() {
        let output = tddDemo.fizzBuzz(input: 5)
        XCTAssertEqual(output, "Buzz")
    }
    
    func test__input_is_15__output_is_FizzBuzz() {
        let output = tddDemo.fizzBuzz(input: 15)
        XCTAssertEqual(output, "FizzBuzz")
    }
}
