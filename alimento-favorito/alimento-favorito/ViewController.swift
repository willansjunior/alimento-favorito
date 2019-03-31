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
    
    @IBAction func add() {
        let name = nameField?.text
        let happiness = happinessField?.text
        print("Comi \(name) e a nota foi \(happiness)")
    }

}

