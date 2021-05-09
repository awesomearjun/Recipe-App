//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by A P on 2021-05-02.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    
    
    var body: some View {
        ScrollView {
            
            // MARK: Recipe Image
            
            Image(recipe.image)
                .resizable()
                .scaledToFit()
            
            // MARK: Ingredients
            
            VStack(alignment: .leading) {
                Text("Ingredients:")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 104.831)
                
                ForEach(recipe.ingredients, id: \.self) { item in
                    Text("• " + item)
                        .font(.body)
                        .padding(.bottom, -0.32)
                }
            }
            .padding(.horizontal)
            
            // MARK: Divider:
            Divider()
            
            // MARK: Directions
            VStack(alignment: .leading) {
                Text("Directions:")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 167.603)
                ForEach(0...recipe.directions.count-1, id: \.self) { item in
                    Text("\(String(item + 1)). \(recipe.directions[item])")
                        .padding(.bottom, 5)
                }
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
