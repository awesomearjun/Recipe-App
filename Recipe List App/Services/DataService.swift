//
//  DataService.swift
//  Recipe List App
//
//  Created by A P on 2021-04-29.
//

import Foundation

class DataService: Codable {
    static func getLocalData() -> [Recipe] {
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                }
                
                
                return recipeData
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        
        return [Recipe]()
    }
}
