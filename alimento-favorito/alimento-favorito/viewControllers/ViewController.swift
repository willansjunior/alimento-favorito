//
//  ViewController.swift
//  alimento-favorito
//
//  Created by Willans Júnior on 30/03/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

//UITableViewDataSource utilizado para utilizar o TableView no Controller
class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var nameField : UITextField?
    @IBOutlet var happinessField : UITextField?
    
    var items = [
        Item(name: "Beringela", calories: 10),
        Item(name: "Brownie", calories: 10),
        Item(name: "Zucchini", calories: 10),
        Item(name: "Muffin", calories: 10),
        Item(name: "Coconut oil", calories: 10),
        Item(name: "Chocolate frosting", calories: 10),
        Item(name: "Chocolate chip", calories: 10)
        ]
    
    var delegate : AddAMealDelegate?
    
    @IBAction func add() {
        if (nameField == nil || happinessField == nil) {
            return
        }
        
        let name:String = nameField!.text!
        if let happiness = Int(happinessField!.text!) {
            let meal = Meal(name: name, happiness: happiness)
            
            print("Comi \(meal.name) e a nota foi \(meal.happiness)")
            
            if (delegate == nil) {
                return
            }
            
            delegate?.add(meal)
            
            if let navigation = navigationController {
                navigation.popViewController(animated: true)
            }
        }
        
    }
    
    //Numero de itens para a TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //Exposicao dos itens na TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        return cell
    }

}

