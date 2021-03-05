//
//  CriadorLeilao.swift
//  Leilao
//
//  Created by Michel dos Santos on 04/03/21.
//

import UIKit

class CriadorLeilao: NSObject {
    
    private var leilao: Auction!
    
    func para(descricao: String) -> Self{
        
        leilao = Auction(descricao: descricao)
        
        return self
        
    }
    
    func  lance(_ user: User , valor: Double) -> Self{
        leilao.propoe(Bid(user, valor))
        
        return self
    }
    
    func constroi() -> Auction{
        
        return leilao
    }

}
