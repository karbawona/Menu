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
    
    init(n: String, cat: String, prTime: String) {
        name = n
        category = cat
        preparationTime = prTime
    }
    
    
 

}



struct Dishes : Codable {
    
    let dishesStruct : [Dish]
}


func loadJsonmm() -> [Dish]? {
    if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Dishes.self, from: data)
            print (jsonData.dishesStruct)
            return jsonData.dishesStruct
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}

//func getFromFile()
//{
//    let path: NSString = Bundle.main.path(forResource: "days",
//                                          ofType: "json")! as NSString
//    let data : NSData = try! NSData(contentsOfFile: path as String,
//                                    options: NSData.ReadingOptions.dataReadingMapped)
//    
//    let dict: NSDictionary!=(try! JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers)) as? NSDictionary
//    
//    for i in 0..<(dict.value(forKey: "Marvel") as! NSArray).count
//    {
//        arrayDict.add((dict.value(forKey: "Marvel") as! NSArray).object(at: i))
//    }
//    for i in 0..<(dict.value(forKey: "DC") as! NSArray).count
//    {
//        arrayDict.add((dict.value(forKey: "DC") as! NSArray).object(at: i))
//    }
//   // newTableView.reloadData()
//}
//

extension Decodable {
    
    static func fromJSON<T:Decodable>(_ fileName: String, fileExtension: String="json", bundle: Bundle = .main) throws -> T {
        guard let url = bundle.url(forResource: fileName, withExtension: fileExtension) else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorResourceUnavailable)
        }
        
        let data = try Data(contentsOf: url)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
