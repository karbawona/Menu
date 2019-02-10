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
    
     //print(path)

    override func viewDidLoad() {
        super.viewDidLoad()
       let  path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("saving.json")
        //print(path)
        
        do{
           let input = try String (contentsOf: path!)
        print (input)
        } catch{ print (error) }
   
    }
    


    
    
    
    
    
    
    
    
    @IBOutlet weak var drawedDish: UITextView!
    
    @IBAction func drawDish(_ sender: Any) {
    }
    
    @IBAction func checkDishes(_ sender: Any) {
    }
    
    @IBAction func addNewDish(_ sender: Any) {
    }



    
    
}

