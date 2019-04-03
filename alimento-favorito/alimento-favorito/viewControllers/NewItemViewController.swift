//
//  NewItemViewController.swift
//  alimento-favorito
//
//  Created by Willans Júnior on 03/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    @IBAction func addNewItem() {
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
