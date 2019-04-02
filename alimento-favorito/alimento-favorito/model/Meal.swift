//
//  Meal.swift
//  alimento-favorito
//
//  Created by Willans Júnior on 01/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import Foundation

class Meal {
    let name: String
    let happiness:Int
    let items = Array<Item>()
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func callCalories() -> Double {
        var total = 0.0
        for item in items {
            total += item.calories
        }
        return total
    }

}
