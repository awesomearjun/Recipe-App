//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by A P on 2021-05-02.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Image name
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                
                // MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                    
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Spacer()
                
                // MARK: Ingredients
                
                VStack(alignment: .leading) {
                    Text("Ingredients:")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• \(RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServing: selectedServingSize)) \(item.name.lowercased())")
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
