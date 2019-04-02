//
//  MealsTableViewController.swift
//  alimento-favorito
//
//  Created by Willans Júnior on 02/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class MealsTableViewController : UITableViewController {
    
    var meals = [Meal(name: "Sorvete de Morango", happiness: 5),
                 Meal(name: "Risole", happiness: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        return cell
    }
    
}