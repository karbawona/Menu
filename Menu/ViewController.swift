//
//  ViewController.swift
//  Menu
//
//  Created by Ola on 06/02/2019.
//  Copyright © 2019 Aleksandra Klein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dishes = [Dish]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        guard let jsonData = url else{return}
        guard let data = try? Data(contentsOf: jsonData) else { return }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else{return}
    
       // print(json)
        
        do{
        let decoder = JSONDecoder()
            self.dishes = try decoder.decode([Dish].self, from: data)
        } catch let error {
            print(error as? Any)
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

