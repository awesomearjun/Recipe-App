//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by A P on 2021-05-09.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            ReceipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
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
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
