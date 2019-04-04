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
    let items:Array<Item>
    
    init(name:String, happiness:Int, items:Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    func callCalories() -> Double {
        var total = 0.0
        for item in items {
            total += item.calories
        }
        return total
    }
    
    func details() -> String {
        var message = "A felicidade \(happiness)"
        for item in items {
            message += "\n \(item.name) - calorias: \(item.calories)"
        }
        return message
    }

}
