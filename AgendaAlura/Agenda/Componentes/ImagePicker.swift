//
//  ImagePicker.swift
//  Agenda
//
//  Created by Michel dos Santos on 28/04/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

enum MenuOpcoes {
    case camera
    case biblioteca
}

protocol imagePickerFotoSelecionada {
    func imagePickerFotoSelecionada(_ foto: UIImage)
}

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    //MARK: -Atibutos
    
    var delegate: imagePickerFotoSelecionada?
    
    //MARK: Métodos
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let foto = info[UIImagePickerControllerOriginalImage] as!  UIImage
        delegate?.imagePickerFotoSelecionada(foto)
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func menuDeOpcoes(completion: @escaping(_ opcao: MenuOpcoes) -> Void) -> UIAlertController {
        let menu = UIAlertController(title: "Atenção", message: "Escolha uma das opções abaixo", preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Tirar Foto", style: .default) { (acao) in
            completion(.camera)
        }
        menu.addAction(camera)
        
        let biblioteca  = UIAlertAction(title: "Bilioteca", style: .default) { (acao) in
            completion(.biblioteca)
        }
        menu.addAction(biblioteca)
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        menu.addAction(cancelar)
         
        return menu
    }

}
