//
//  Mensagem.swift
//  Agenda
//
//  Created by Michel dos Santos on 15/05/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MessageUI

class Mensagem: NSObject {
    
    //MARk:  - Metodos
    
    func configuraSMS() -> MFMessageComposeViewController {
        let componenteMessagem = MFMessageComposeViewController()
        
        
        
        return componenteMessagem
    }

}

extension Mensagem: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}
