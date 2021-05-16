//
//  ReceipeFeaturedView.swift
//  Recipe List App
//
//  Created by A P on 2021-05-12.
//

import SwiftUI

struct ReceipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .font(Font.custom("Avenir Heavy", size: 44))
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 40)
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    ForEach(0..<model.recipes.count) { index in
                        if model.recipes[index].featured == true {
                            Button(action: {
                                self.isDetailViewShowing = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .clipped()
                                            .aspectRatio(contentMode: .fill)
                                        Text(model.recipes[index].name)
                                            .foregroundColor(.black)
                                            .padding(5)
                                            .font(Font.custom("avenir", size: 17))
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(10)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preperation time:")
                    .font(Font.custom("Avenir Heavy", size: 24))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("avenir", size: 17))
                Text("Highlights:")
                    .font(Font.custom("Avenir Heavy", size: 24))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
        }
        .onAppear(perform: {
            findFistFeaturedRecipeIndex()
        })
    }
    
    func findFistFeaturedRecipeIndex() {
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct ReceipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        ReceipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
