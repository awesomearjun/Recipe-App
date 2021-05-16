//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by A P on 2021-05-16.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHightlights = ""
    
    init(highlights:[String]) {
        for index in 0..<highlights.count {
            if index == highlights.count - 1 {
                allHightlights += highlights[index]
            } else {
                allHightlights += "\(highlights[index]), "
            }
        }
    }
    
    var body: some View {
        Text(allHightlights)
            .font(Font.custom("avenir", size: 17))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2"])
    }
}
