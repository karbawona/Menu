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

    
}

struct Dishes : Codable {
    
    let dishes : [Dish]
}
