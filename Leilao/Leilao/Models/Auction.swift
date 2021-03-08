//
//  Auction.swift
//  Leilao
//
//  Created by Michel dos Santos on 01/03/21.
//

import Foundation

class Auction {
    
    let descricao:String
    let imagem:String?
    var lances:[Bid]?
    
    init(descricao:String, imagem:String? = nil, lances:[Bid] = []) {
        self.descricao = descricao
        self.imagem = imagem
        self.lances = lances
    }
    
    func propoe(_ bid:Bid) {
        guard let listaLances = lances else { return }
        
        if listaLances.count == 0 || podeDarLances(bid.user, listaLances) {
            lances?.append(bid)
        }
        
    }
    
    private func ultimoLance(_ lances: [Bid]) -> Bid{
        return lances[lances.count - 1]
        
    }
    
    private func podeDarLances(_ user: User, _ lances: [Bid]) -> Bool {
        
        if  ultimoLance(lances).user != user  && quantidadeLancesUser(user) < 5{
            return true
        }
        return false
    }
    
    private func quantidadeLancesUser(_ user:User) -> Int{
        
        guard let listaLances = lances else { return 0 }
        var lancesDoUser = 0
        for lance in listaLances{
            if lance.user == user{
                lancesDoUser += 1
            }
        }
        
        return lancesDoUser
    }
}
