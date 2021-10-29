//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Fletcher Deal on 10/13/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of dataService and get the data
        self.recipes = DataService.getLocalData()
        
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServingSize:Int) -> String {
        var portion = ""
        // the "??" gives it an option to use if ingredient.num is nil
        var numerator = ingredient.num ?? 1
        var denominatior = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            // get a single serving size by multiplying denominatior by recipe servings
            denominatior *= recipeServings
            
            // get target portion by multiplying numerator by target servings
            numerator *= targetServingSize
            
            // reduce fraction by greatest common diviser
            let divisor = Rational.greatestCommonDivisor(numerator, denominatior)
            numerator /= divisor
            denominatior /= divisor
            
            // get whole portions id numerator > denominator
            if numerator >= denominatior {
                // calculate the whole portions
                wholePortions = numerator / denominatior
                
                // calcualte the remainder
                numerator = numerator % denominatior
                
                // assign the string
                portion += String(wholePortions)
            }
            // express the remainder as a fraction
            if numerator > 0 {
                // Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominatior)"
            }
        }
        
        if var unit = ingredient.unit {
            
            // calcualte appropriate suffix
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            
            return portion + unit
        }
        
        return portion
    }
    
}
