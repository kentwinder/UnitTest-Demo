//
//  TDDDemo.swift
//  UnitTest-Demo
//
//  Created by Kent Winder on 4/1/17.
//  Copyright © 2017 Kent Winder. All rights reserved.
//

import Foundation

class TDDDemo {
    
    // If the number is divisible by three, the function should output Fizz.
    // If the number is divisible by five, the function should output Buzz.
    // If the number is divisible by both three AND five, the function should output Fizz Buzz.
    // Otherwise, the number entered is simply returned as output.
    func fizzBuzz(input: Int) -> String {
        if input % 15 == 0 {
            return "FizzBuzz"
        }
        
        if input % 3 == 0 {
            return "Fizz"
        }
        
        if input % 5 == 0 {
            return "Buzz"
        }
        
        return "\(input)"
    }
}
