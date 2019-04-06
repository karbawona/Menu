//
//  AllDishesViewController.swift
//  Menu
//
//  Created by Ola on 27/02/2019.
//  Copyright © 2019 Aleksandra Klein. All rights reserved.
//

import UIKit

class AllDishesViewController :  UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
//    var data : Dishes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let  path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("saving.json")
//
//        do {
//            let input = try String (contentsOf: path!)
//            let contentData = input.data(using: .utf8)
//
//            let jsDec = JSONDecoder()
//            do {
//                data = try jsDec.decode(Dishes.self, from: contentData!)
//            } catch {
//                print ("nie dziala data")
//                print(error)
//            }
//        } catch {
//            print (error) }
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDish", for: indexPath)
        cell.textLabel?.text = "\(dishArray[indexPath.row].name)"
        return cell
    }


    @IBAction func returnTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
