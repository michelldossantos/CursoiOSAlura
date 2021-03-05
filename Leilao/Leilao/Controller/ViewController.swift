//
//  ViewController.swift
//  Leilao
//
//  Created by Michel dos Santos on 27/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        // Cenario
        
        let joao = User(nome: "Joao")
        let jose = User(nome: "Jose")
        let maria = User(nome: "Maria")
        
        let leilao = Auction(descricao: "Playstation 4")
        leilao.propoe(Bid(maria, 250.0))
        leilao.propoe(Bid(joao, 300.0))
        leilao.propoe(Bid(jose, 400.0))
        
        // Acao
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        leiloeiro.pegaOSMaioresLancesNoLeila(leilao)
      
        
       
    }

}



