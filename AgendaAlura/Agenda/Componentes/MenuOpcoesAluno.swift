//
//  MenuOpcoesAluno.swift
//  Agenda
//
//  Created by Michel dos Santos on 15/05/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

enum MenuActionSheetAluno {
    
    case sms
    case ligacao
    case waze
    case mapa
}

class MenuOpcoesAluno: NSObject {
    
    func configuraMenuOpcoesDoAluno (completion: @escaping(_ opcao: MenuActionSheetAluno) -> Void ) -> UIAlertController {
        
        let menu = UIAlertController(title: "Atenção", message: "Escolha uma das opções abaixo", preferredStyle: .actionSheet)
        
        let sms = UIAlertAction(title: "Enviar SMS", style: .default) { acao in
            completion(.sms)
        }
        
        let ligacao = UIAlertAction(title: "Ligar", style: .default) { acao in
            completion(.ligacao)
        }
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        let wazee = UIAlertAction(title: "Localizar no waze", style: .default) { acao in
            completion(.waze)
        }
        
        let mapa = UIAlertAction(title: "Abrir no mapa", style: .default) { acao in
            completion(.mapa)
        }
        
        menu.addAction(sms)
        menu.addAction(cancelar)
        menu.addAction(ligacao)
        menu.addAction(wazee)
        menu.addAction(mapa)

        return menu
        
    }
}
