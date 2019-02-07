//
//  ViewController.swift
//  Menu
//
//  Created by Ola on 06/02/2019.
//  Copyright © 2019 Aleksandra Klein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dishes : [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let url = Bundle.main.url(forResource: "data", withExtension: "json")
//        guard let jsonData = url else{return}
//        guard let dataJson = try? Data(contentsOf: jsonData) else { return }
//        guard let json = try? JSONSerialization.jsonObject(with: dataJson, options: []) else{return}
        
       //   dishes =  loadJson()!
        
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let dishesJson = jsonResult["dishes"] as? [Any] {
                    print(dishesJson)
                }
            } catch {
                // handle error
            }
        }
}


    
    @IBOutlet weak var drawedDish: UITextView!
    
    @IBAction func drawDish(_ sender: Any) {
    }
    
    @IBAction func checkDishes(_ sender: Any) {
    }
    
    @IBAction func addNewDish(_ sender: Any) {
    }



    
    
}

