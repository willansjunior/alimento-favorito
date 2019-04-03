//
//  Item.swift
//  alimento-favorito
//
//  Created by Willans Júnior on 01/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import Foundation

class Item: Equatable {
    
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
}

func ==(first:Item, second:Item) -> Bool {
    return first.name == second.name && first.calories == second.calories
}
