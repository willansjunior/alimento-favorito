//
//  Alert.swift
//  alimento-favorito
//
//  Created by Willans Júnior on 04/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    //Implementacao de um alert generico
    func show(_ title:String = "Aviso", message: String = "Erro inesperado!") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Entendi", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(ok)
        
        controller.present(alert, animated: true, completion: nil)
    }
    
}
