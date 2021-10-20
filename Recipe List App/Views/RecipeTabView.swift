//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Fletcher Deal on 10/20/21.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView {
            Text("Fetured View")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Fetaured")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
