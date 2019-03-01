//
//  AddNewDishViewController.swift
//  Menu
//
//  Created by Ola on 01/03/2019.
//  Copyright © 2019 Aleksandra Klein. All rights reserved.
//

import UIKit

class AddNewDishViewController : UIViewController {

    var data : Dishes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let  path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("saving.json")
        //      print(path)
        
        do{
            let input = try String (contentsOf: path!)
            //     print (input)
            let contentData = input.data(using: .utf8)
            
            let jsDec = JSONDecoder()
            do {
                data = try jsDec.decode(Dishes.self, from: contentData!)
                //     print (data)
            } catch {
                print ("nie dziala data")
                print(error)
            }
        } catch{ print (error) }
        //
        //        for index in 0...3 {
        //            print("category: \(String(describing: data!.dishesStruct[index].category))")
        //            print("name: \(String(describing: data!.dishesStruct[index].name))")
        //            print("time: \(String(describing: data!.dishesStruct[index].preparationTime))")
        //        }
        
        
    }
    

    @IBAction func returnTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var newName: UITextField!
    
 
    @IBOutlet weak var newCategory: UITextField!
    
    @IBOutlet weak var newTime: UITextField!
    
    @IBAction func addAll(_ sender: Any) {
        
        var count = data!.dishesStruct.count
        let newDish = Dish(name: newName.text!, category: newCategory.text!, preparationTime: newTime.text!)
        data!.dishesStruct.append(newDish)
        print (data!.dishesStruct.last?.name)
        
        
    }
    
}
