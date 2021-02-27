//
//  RemoveViewController.swift
//  eggplantAlura
//
//  Created by Michel dos Santos on 19/02/21.
//

import UIKit

class RemoveViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlert(meal:Meals, hundler: @escaping (UIAlertAction) -> Void){
        
        let alert = UIAlertController(title: meal.nome, message: meal.mealDetail(), preferredStyle: .alert)
        let buttonCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let buttonRemove = UIAlertAction(title: "Remove", style: .destructive, handler: hundler)
        
        alert.addAction(buttonCancel)
        alert.addAction(buttonRemove)
        controller.present(alert, animated: true, completion: nil)
    }
}
