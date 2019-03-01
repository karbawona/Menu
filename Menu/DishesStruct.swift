//
//  DishesStruct.swift
//  Menu
//
//  Created by Ola on 06/02/2019.
//  Copyright © 2019 Aleksandra Klein. All rights reserved.
//

import Foundation



struct Dish : Codable {
    
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


