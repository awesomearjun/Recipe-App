//
//  Recipe.swift
//  Recipe List App
//
//  Created by A P on 2021-04-29.
//

import Foundation

class Recipe:Identifiable, Decodable {
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[Ingredient]
    var highlights:[String]
    var directions:[String]
}
