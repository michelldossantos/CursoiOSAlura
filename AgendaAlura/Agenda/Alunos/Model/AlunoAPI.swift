//
//  AlunoAPI.swift
//  Agenda
//
//  Created by Michel dos Santos on 31/05/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import Alamofire
class AlunoAPI: NSObject {

    func salvaAlunoNoServidor() {
        
        guard let url = URL(string: "http://localhost:8080/api/aluno/lista") else { return }
        Alamofire.requestecatch
            }
    

    
}
