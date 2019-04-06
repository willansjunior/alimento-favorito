//
//  MealsTableViewController.swift
//  alimento-favorito
//
//  Created by Willans Júnior on 02/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class MealsTableViewController : UITableViewController, AddAMealDelegate {
    
    var meals = [Meal(name: "Sorvete de Morango", happiness: 5),
                 Meal(name: "Risole", happiness: 5)]
    
    func add(_ meal:Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMeals") {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        //Adicionando uma funcao de long press a lista
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
    }
    
    @objc func showDetails(recognizer: UILongPressGestureRecognizer) {
        if (recognizer.state == UILongPressGestureRecognizer.State.began) {
            let cell = recognizer.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let row = indexPath.row
                let meal = meals[row]
                
                RemoveMealController(controller: self).show(meal, handler : { action in
                    //Adicionando closure para substituir a função de remoção dentro e expor o codigo dentro do handler
                    self.meals.remove(at: row)
                    self.tableView.reloadData()
                })
                
//                //Montando um alert
//                let details = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertController.Style.alert)
//                
//                //Função para o botão de remover
////                func removeSelected(action:UIAlertAction) {
////                    meals.remove(at: row)
////                    tableView.reloadData()
////                }
//                
//                //Criando botão de OK para o alert
//                let cancel = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
//                let remove = UIAlertAction(title: "Remover", style: UIAlertAction.Style.destructive, handler: { action in
//                    //Adicionando closure para substituir a função de remoção dentro e expor o codigo dentro do handler
//                    self.meals.remove(at: row)
//                    self.tableView.reloadData()
//                })
//                
//                //Atribuindo botão de OK ao alert
//                details.addAction(cancel)
//                details.addAction(remove)
//                
//                //Exibindo o alert
//                present(details, animated: true, completion: nil)
            }
        }
    }
    
}
