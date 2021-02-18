//
//  Meals.swift
//  eggplantAlura
//
//  Created by Michel dos Santos on 16/02/21.
//

import UIKit

class Meals: NSObject {
    
    let nome: String
    let felicidade: Int
    var itens = [Item]()
  
    
    init(nome: String, felicidade: Int, items: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = items
    }
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }

}
