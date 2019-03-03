//
//  AddNewDishViewController.swift
//  Menu
//
//  Created by Ola on 01/03/2019.
//  Copyright © 2019 Aleksandra Klein. All rights reserved.
//

import UIKit

class AddNewDishViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    let categ = ["przekąska", "zupa", "danie główne", "ryba", "zapiekanka", "makaron"]
    var data : Dishes?
    var temp : String?
    
    override func viewDidLoad() {
        newCategory.delegate = self
        newCategory.dataSource = self
        
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

    @IBOutlet weak var newTime: UITextField!
    
    @IBOutlet weak var newCategory: UIPickerView!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categ.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        temp = categ[row]
        return temp
    }
    

    
    
    
    @IBAction func addAll(_ sender: Any) {
        

        if newName.text! != "" && temp! != "" && newTime.text! != "" {
        let newDish = Dish(name: newName.text!, category: temp!, preparationTime: newTime.text!)
        data!.dishesStruct.append(newDish)
        print (data!.dishesStruct.last?.name)
              print (data!.dishesStruct.last?.category)
              print (data!.dishesStruct.last?.preparationTime)
        }
        
    }
    
}
