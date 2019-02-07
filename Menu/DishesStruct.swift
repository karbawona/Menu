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
    
//    init(n: String, cat: String, prTime: String) {
//        name = n
//        category = cat
//        preparationTime = prTime
//    }

    
}

struct Dishes : Codable {
    
    let dishesStruct : [Dish]
}



func loadJson() -> [Dish]? {
    if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Dishes.self, from: data)
            return jsonData.dishesStruct
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
