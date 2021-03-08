//
//  Avaliador.swift
//  Leilao
//
//  Created by Michel dos Santos on 01/03/21.
//

import Foundation

class Avaliador {
    
    private var maiorDeTodos = Double.leastNonzeroMagnitude
    private var menorDeTodos = Double.greatestFiniteMagnitude
    private var maioresLances: [Bid] = []
    
    func avalia(leilao:Auction) {
        guard let lances = leilao.lances else { return }
        
        for lance in lances {
            if lance.valor > maiorDeTodos {
                maiorDeTodos = lance.valor
            }
            if lance.valor < menorDeTodos {
                menorDeTodos = lance.valor
            }
        }
        pegaOSMaioresLancesNoLeila(leilao)
    }
    
    func maiorLance() -> Double {
        return maiorDeTodos
    }
    
    func menorLance() -> Double {
        return menorDeTodos
    }
    
    func tresMaiores() -> [Bid]{
        return maioresLances
    }
    
   func pegaOSMaioresLancesNoLeila(_ leilao: Auction){
        
        guard let lances = leilao.lances else {return}
        
        maioresLances = lances.sorted(by: { (lista1, lista2) -> Bool in
            return lista1.valor > lista2.valor
        })
        
    let maiores  = maioresLances.prefix(3)
        maioresLances = Array(maiores)
    
    }
    
    
    
}
