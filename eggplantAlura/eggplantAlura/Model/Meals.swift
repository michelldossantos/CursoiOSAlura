//
//  Meals.swift
//  eggplantAlura
//
//  Created by Michel dos Santos on 16/02/21.
//

import UIKit

class Meals: NSObject, NSCoding {
    
    
    
    let nome: String
    let felicidade: Int
    var itens = [Item]()
  
    //MARK: Init
    init(nome: String, felicidade: Int, items: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = items
    }
    
    //MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        felicidade = coder.decodeInteger(forKey: "felicidade")
        itens = coder.decodeObject(forKey: "itens") as! [Item]
    }
     
    //MARK: - Metodos
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
    
    func mealDetail() -> String{
        var messagem = "Felicidade: \(felicidade)"
        
        for item in itens{
            messagem += ", \(item.nome)  - Calories: \(item.calorias)"
        }
        
        return messagem
        
    }

}
