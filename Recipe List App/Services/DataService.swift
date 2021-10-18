//
//  DataService.swift
//  Recipe List App
//
//  Created by Fletcher Deal on 10/13/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //creating a guard statement
        //check if tpathString is not nil, otherwise...
        guard pathString != nil else {
            // return
            return[Recipe]()
        }
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // create a data object
            let data = try Data(contentsOf: url)
            // decode the data eith a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                
                // Add the unique ids
                for r in recipeData {
                    r.id = UUID()
            q}
                // Return the recipes
                return recipeData
                
            }
            catch {
                // error with decoding data
                print(error)
            }
            
        }
        catch {
            // error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
    
}
