//
//  ContentView.swift
//  Recipe List App
//
//  Created by Fletcher Deal on 10/13/21.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the ViewModel
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        
        
        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink {
                    RecipeDetailView(recipe: r)
                } label: {
                    HStack {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(7)
                        Text(r.name)
                    }                }

                
            }
            .listStyle(PlainListStyle())
            .navigationTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
