//
//  Dao.swift
//  alimento-favorito
//
//  Created by Willans Júnior on 08/04/19.
//  Copyright © 2019 Willans Júnior. All rights reserved.
//

import Foundation

class Dao {
    
    //Salva a lista das refeições
    func save(_ meals:Array<Meal>) {
        NSKeyedArchiver.archiveRootObject(meals, toFile: getArchive(for: "meals"))
    }
    
    //Busca todas as refeições
    func load() -> Array<Meal> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: getArchive(for: "meals")) {
            return loaded as! Array<Meal>
        }
        return []
    }
    
    //Salva a lista de itens
    func save(_ items:Array<Item>) {
        NSKeyedArchiver.archiveRootObject(items, toFile: getArchive(for: "items"))
    }
    
    //Busca todos os itens
    func load() -> Array<Item> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: getArchive(for: "items")) {
            return loaded as! Array<Item>
        }
        return []
    }
    
    func getArchive(for resource:String) -> String {
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        let archive = "\(dir)/alimento-favorito-\(resource).dados"
        return archive
    }
    
}
