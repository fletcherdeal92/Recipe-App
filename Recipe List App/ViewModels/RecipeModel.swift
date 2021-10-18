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
    
}
