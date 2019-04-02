//
//  ViewController.swift
//  alimento-favorito
//
//  Created by Willans Júnior on 30/03/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField : UITextField?
    @IBOutlet var happinessField : UITextField?
    
    var mealsTable : MealsTableViewController?
    
    @IBAction func add() {
        if (nameField == nil || happinessField == nil) {
            return
        }
        
        let name:String = nameField!.text!
        if let happiness = Int(happinessField!.text!) {
            let meal = Meal(name: name, happiness: happiness)
            
            print("Comi \(meal.name) e a nota foi \(meal.happiness)")
            
            if (mealsTable == nil) {
                return
            }
            
            mealsTable?.add(meal)
            
            if let navigation = navigationController {
                navigation.popViewController(animated: true)
            }
        }
        
    }

}

