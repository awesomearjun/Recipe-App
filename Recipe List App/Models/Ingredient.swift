//
//  Ingredient.swift
//  Recipe List App
//
//  Created by A P on 2021-05-09.
//

import Foundation


class Ingredient: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
