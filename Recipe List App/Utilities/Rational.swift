//
//  Rational.swift
//  Recipes
//
//  Created by Micah Beech on 2020-09-28.
//

import Foundation

struct Rational {

    static func greatestCommonDivisor(firstNumber a: Int, secondNumber b: Int) -> Int {
        
        // GCD(0, b) = b
        if a == 0 { return b }
        
        // GCD(a, 0) = a
        if b == 0 { return a }
        
        // Otherwise, GCD(a, b) = GCD(b, remainder)
        return greatestCommonDivisor(firstNumber: b, secondNumber: a % b)
    }
    
}
