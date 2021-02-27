//
//  PackagesTravel.swift
//  AluraViagens
//
//  Created by Michel dos Santos on 24/02/21.
//

import UIKit

class PacoteViagem: NSObject {

    let nameHotel: String
    let descriptionPackage: String
    let dateTravel: String
    let travel: Viagem
    
    

    init(nomeHotel:String, descricao:String, dataViagem:String, viagem: Viagem) {
        self.nameHotel = nomeHotel
        self.descriptionPackage = descricao
        self.dateTravel = dataViagem
        self.travel = viagem
    }
}
