//
//  Alert.swift
//  eggplantAlura
//
//  Created by Michel dos Santos on 19/02/21.
//

import UIKit

class Alert {
    
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func show(title: String = "Atenção", message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(buttonCancel)
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
