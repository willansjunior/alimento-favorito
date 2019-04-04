//
//  NewItemViewController.swift
//  alimento-favorito
//
//  Created by Willans Júnior on 03/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    //Criacao da variavel delegate
    var delegate:AddAnItemDelegate?
    
    //Inicializando o delegate
    init(delegate: AddAnItemDelegate) {
        //Obrigatorio o uso do super por eranca da classe pai
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBOutlet var nameFiled : UITextField?
    @IBOutlet var caloriesFild : UITextField?
    
    @IBAction func addNewItem() {
        let name = nameFiled!.text
        let calories = Double(caloriesFild!.text!)
        
        //Validando se os dados e o delegate sao nulos
        if (name == nil || calories == nil || delegate == nil) {
            return
        }
        
        //Inicializando item
        let item = Item(name: name!, calories: calories!)
        //Utilizando delegate para chamar o metodo de adicionar item da interface
        delegate!.add(item)
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
