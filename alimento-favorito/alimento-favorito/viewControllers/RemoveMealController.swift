//
//  RemoveMealController.swift
//  alimento-favorito
//
//  Created by Willans Júnior on 05/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController {
    
    let controller:UIViewController
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(_ meal:Meal, handler: @escaping (UIAlertAction) -> Void) {
        //Montando um alert
        let details = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertController.Style.alert)
        
        //Criando botão de OK para o alert
        let cancel = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        let remove = UIAlertAction(title: "Remover", style: UIAlertAction.Style.destructive, handler: handler)
        
        //Atribuindo botão de OK ao alert
        details.addAction(cancel)
        details.addAction(remove)
        
        //Exibindo o alert
        controller.present(details, animated: true, completion: nil)
    }
    
}
