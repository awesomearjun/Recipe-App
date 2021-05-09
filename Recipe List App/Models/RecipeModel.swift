//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by A P on 2021-04-29.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        self.recipes = DataService.getLocalData()
    }
}
