//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by A P on 2021-04-29.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        self.recipes = DataService.getLocalData()
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServing:Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            denominator *= recipeServings
            numerator *= targetServing
            
            let divisor = Rational.greatestCommonDivisor(firstNumber: numerator, secondNumber: denominator)
            
            numerator /= divisor
            denominator /= divisor
            
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator %= denominator
                
                portion += String(wholePortions)
            }
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return "\(portion) \(unit)"
        }
        
        return portion
    }
}
