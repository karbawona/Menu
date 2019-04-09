//
//  ViewController.swift
//  Menu
//
//  Created by Ola on 06/02/2019.
//  Copyright © 2019 Aleksandra Klein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    var dataDishes : Dishes?
    var inString = """
{
    "dishes": [
    { "name": "pomidorowa", "category": "zupa", "preparationTime": "1 h" },
    { "name": "rosol", "category": "zupa", "preparationTime": "1 h" },
    { "name": "spaghetti", "category": "makaron", "preparationTime": "45 min" },
    { "name": "makaron ze szpinakiem", "category": "makaron", "preparationTime": "30 min" }
    ]
}
"""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dish1 = Dish(name: "rosół", category: "obiad", preparationTime: "1h")
        let dish2 = Dish(name: "kluski", category: "obiad", preparationTime: "30min")
        let dish3 = Dish(name: "pierogi", category: "obiad", preparationTime: "1h")
        let threeDishes = [dish1, dish2, dish3]
        let dishes = Dishes(dishesStruct: threeDishes)
        
        let encoder = JSONEncoder()
        let dataa = try? encoder.encode(dishes)
        
      
 
        let documentsPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        let logsPath = documentsPath.appendingPathComponent("data")
        print(documentsPath)
        
        
   
        do{
            try FileManager.default.createDirectory(atPath: logsPath!.path, withIntermediateDirectories: true, attributes: [FileAttributeKey.protectionKey: FileProtectionType.none] )
            
        }catch let error as NSError{
            print("Unable to create directory",error)
        }
        
        if let dataa = dataa, let dataString = String(data: dataa, encoding: .utf8) {
            print(dataString)
            let tempDataString =  Data(base64Encoded: dataString)
            print(tempDataString) //zmienic tu data, bo tempdatastring=nil, cos tu jest zle, popatrzec jeszcze atrybuty
            
        do{
            try FileManager.default.createFile(atPath: logsPath!.path, contents: tempDataString, attributes: [FileAttributeKey.protectionKey: FileProtectionType.complete])
            print ("i did it")
            
        }catch let error as NSError{
            print("Unable to create file",error)
        }
        
    }
        

        do{
            let input = try String (contentsOf: logsPath!)
            let contentData = input.data(using: .utf8)

            let jsDec = JSONDecoder()
            do {
                dataDishes = try jsDec.decode(Dishes.self, from: contentData!)
            } catch {
                print ("nie dziala data")
                print(error)
            }
        } catch{ print (error) }
        

//        for index in 0...2{
//            print(dataDishes!.dishesStruct.randomElement()?.name)
//        }
        
    }
    

    
   
    
    
    @IBOutlet weak var drawedDish: UITextView!
    
    @IBAction func drawDish(_ sender: Any) {
   //     drawedDish.text = data!.dishesStruct.randomElement()?.name
        drawedDish.text = dishArray.randomElement()?.name
        
    }
    
    @IBAction func checkDishes(_ sender: Any) {
    }
    
    @IBAction func addNewDish(_ sender: Any) {
    }


    
    
}

