//
//  Bid.swift
//  Leilao
//
//  Created by Michel dos Santos on 01/03/21.
//

import Foundation


class Bid {
    
    let user:User
    let valor:Double
    
    init(_ user:User, _ valor:Double) {
        self.user = user
        self.valor = valor
    }
}
