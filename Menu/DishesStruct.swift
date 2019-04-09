//
//  DishesStruct.swift
//  Menu
//
//  Created by Ola on 06/02/2019.
//  Copyright © 2019 Aleksandra Klein. All rights reserved.
//

import Foundation



public struct Dish : Codable{
    
    let name : String
    let category : String
    let preparationTime : String
    
    init(name: String, category: String, preparationTime: String) {
        self.name = name
        self.category = category
        self.preparationTime = preparationTime
    }
    
}

struct Dishes : Codable {

    var dishesStruct : [Dish]
    enum CodingKeys : String, CodingKey {
        case dishesStruct = "dishes"
    }
}

let dish1 = Dish(name: "pomidorowa", category: "zupa", preparationTime: "2h")
let dish2 = Dish(name: "makaron ze szpinakiem", category: "obiad", preparationTime: "30 min")
let dish3 = Dish(name: "ziemniaki", category: "obiad", preparationTime: "40 min")

var dishArray : [Dish] = [dish1, dish2, dish3]
