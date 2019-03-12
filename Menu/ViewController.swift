//
//  ViewController.swift
//  Menu
//
//  Created by Ola on 06/02/2019.
//  Copyright © 2019 Aleksandra Klein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   var data : Dishes?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let  path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("saving.json")
        
        
        do{
            let input = try String (contentsOf: path!)
            let contentData = input.data(using: .utf8)
            
            let jsDec = JSONDecoder()
            do {
                data = try jsDec.decode(Dishes.self, from: contentData!)
            } catch {
                print ("nie dziala data")
                print(error)
            }
        } catch{ print (error) }
        
    }
    

    
   
    
    
    @IBOutlet weak var drawedDish: UITextView!
    
    @IBAction func drawDish(_ sender: Any) {
        drawedDish.text = data!.dishesStruct.randomElement()?.name
    }
    
    @IBAction func checkDishes(_ sender: Any) {
    }
    
    @IBAction func addNewDish(_ sender: Any) {
    }


    
    
}

