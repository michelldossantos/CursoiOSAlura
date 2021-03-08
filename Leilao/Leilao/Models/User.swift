//
//  User.swift
//  Leilao
//
//  Created by Michel dos Santos on 01/03/21.
//

import Foundation


class User {
    
    let id:Int?
    let nome:String
    
    init(id:Int? = nil, nome:String) {
        self.id = id
        self.nome = nome
    }
}


extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        if lhs.id != rhs.id || lhs.nome != rhs.nome{
            return false
        }
        return true
    }
    
    
}
