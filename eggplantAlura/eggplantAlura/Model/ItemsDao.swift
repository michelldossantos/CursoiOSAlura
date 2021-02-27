//
//  ItemsDao.swift
//  eggplantAlura
//
//  Created by Michel dos Santos on 20/02/21.
//

import Foundation

class ItemsDao {
    
    func saveItems(_ items: [Item]){
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            guard let way = restoreDirectoy() else {return}
            try data.write(to: way)
        }catch{
            
        }
    }
    
    func itemsRestore() -> [Item]{
        guard let way = restoreDirectoy() else {return []}
        do{
            let data = try Data(contentsOf: way)
            
            guard let itemsSalved = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Item] else {return []}
           return itemsSalved
        }catch{
            print(error.localizedDescription)
            return []
        }
        
    }
    
    func restoreDirectoy() -> URL?{
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
         return  directory.appendingPathComponent("itens")
    }
}
