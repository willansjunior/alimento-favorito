//
//  ViewController.swift
//  alimento-favorito
//
//  Created by Willans Júnior on 30/03/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

//UITableViewDataSource utilizado para utilizar o TableView no Controller
//UITableViewDelegate utilizado para ter acesso ao didSelectRowAt
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
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
    
    var selected = Array<Item>()
    var delegate : AddAMealDelegate?
    @IBOutlet var tableView : UITableView?
    
    func add(_ item: Item) {
        items.append(item)
//        NSKeyedArchiver.archiveRootObject(items, toFile: getArchive())
        Dao().save(items)
        if let table = tableView {
            table.reloadData()
        } else {
            //Chamada de um alert generico
            Alert(controller:self).show(message:"Não foi possivel atualizar a lista")
        }
    }
    
    //Metodo executado ao criar a View
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "new item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showNewItem))
        navigationItem.rightBarButtonItem = newItemButton

        items = Dao().load()
//        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: getArchive()) {
//            self.items = loaded as! Array<Item>
//        }
    }
    
    func getArchive() -> String {
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        let archive = "\(dir)/alimento-favorito-items.dados"
        return archive
    }
    
    //Inicializando a tela de cadastro de novo item
    @objc func showNewItem() {
        //Parametro de delegate criado no controler NewItemViewController
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alert(controller: self).show()
        }
    }
    
    func stringToInt(_ text:String?) -> Int? {
        if let number = text {
            return Int(number)
        }
        return nil
    }
    
    func getMealFromForm() -> Meal? {
        if let name = nameField?.text {
            if let happiness = stringToInt(happinessField?.text) {
                let meal = Meal(name: name, happiness: happiness, items: selected)
                return meal
            }
        }
        return nil
    }
    
    @IBAction func add() {
        if let meal = getMealFromForm() {
            if let meals = delegate {
                meals.add(meal)
                if let navigation = navigationController {
                    navigation.popViewController(animated: true)
                } else {
                    Alert(controller: self).show("Refeição adicionada, mas não foi possivel retornar para tela anterior!")
                }
                return
            }
        }
        Alert(controller: self).show()
        return
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

    //Utilizado para selecionar as linhas do TableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if (cell.accessoryType == UITableViewCell.AccessoryType.none) {
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                let item = indexPath.row
                selected.append(items[item])
            } else {
                cell.accessoryType = UITableViewCell.AccessoryType.none
                let item = items[indexPath.row]
                if let position = selected.firstIndex(of: item) {
                    selected.remove(at: position)
                } else {
                    Alert(controller: self).show()
                }
            }
        } else {
            Alert(controller: self).show()
        }
    }
    
}

