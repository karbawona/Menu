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
    var category : String
    let preparationTime : String
    
    
}



struct Dishes : Codable {
    
    let dishesStruct : [Dish]
    enum CodingKeys : String, CodingKey {
        case dishesStruct = "dishes"
    }
}


