//
//  AutenticacaoLocal.swift
//  Agenda
//
//  Created by Michel dos Santos on 18/05/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import LocalAuthentication

class AutenticacaoLocal: NSObject {

    var erro: NSError?
    
    
    func autorizaUsuario(completion: @escaping (_ autenticado: Bool) -> Void) {
        
        let  contexto = LAContext()
        
    
        if contexto.canEvaluatePolicy(.deviceOwnerAuthentication, error: &erro) {
            contexto.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Deve autenticar para poder excluir usuário") { autenticacao, erro in
                completion(autenticacao)
            }
        }
    }
}
