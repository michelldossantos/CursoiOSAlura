//
//  Viagem.swift
//  AluraViagens
//
//  Created by Michel dos Santos on 20/02/21.
//

import UIKit

class Viagem: NSObject {

    let titulo: String
    let quantidadedeDias: Int
    let preco: String
    let caminhoDaImagem: String
    
    
    init(titulo:String, quantidadeDeDias:Int, preco:String, caminhoDaImagem:String) {
        self.titulo = titulo
        self.quantidadedeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }
}
