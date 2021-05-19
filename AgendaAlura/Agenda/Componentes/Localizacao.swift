//
//  Localizacao.swift
//  Agenda
//
//  Created by Michel dos Santos on 17/05/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import CoreLocation

class Localizacao: NSObject {
    
    func converteEnderecoEmCordenadas(endereco: String, local: @escaping(_ local: CLPlacemark) -> Void ) {
        let conversor = CLGeocoder()
        conversor.geocodeAddressString(endereco) { listaDeLocalicacoes, Error in
            if let localizacao = listaDeLocalicacoes?.first{
                local(localizacao)
            }
        }
    }

}
