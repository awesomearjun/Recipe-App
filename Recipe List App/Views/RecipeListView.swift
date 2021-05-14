//
//  ContentView.swift
//  Recipe List App
//
//  Created by A P on 2021-04-18.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var model:RecipeModel
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes) { r in
                            NavigationLink(
                                destination: RecipeDetailView(recipe: r),
                                label: {
                                    HStack {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5.0)
                                        Text(r.name)
                                            .foregroundColor(.black)
                                    }
                                })
                        }
                    }
                }
                .navigationBarHidden(true)
            }
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
