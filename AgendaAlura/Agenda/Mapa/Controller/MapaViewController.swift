//
//  MapaViewController.swift
//  Agenda
//
//  Created by Michel dos Santos on 17/05/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
    
    
    //MARK OUTLET
    
    @IBOutlet weak var mapa: MKMapView!
    
    //MARK: Variaveis
    
    var aluno: Aluno?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Localizar aluno"
        localizacaoInicial()
        localizarAluno()
    }
    
    func confugurarPino(_ titulo: String, _ localizacao: CLPlacemark) -> MKPointAnnotation {
        
        let pino = MKPointAnnotation()
        pino.title = titulo
        pino.coordinate = localizacao.location!.coordinate
        
        
        return pino
    }
    
    func localizacaoInicial () {
        Localizacao().converteEnderecoEmCordenadas(endereco: "Sapiranga - RS") { localizacaoEncontrada in
            let pino = MKPointAnnotation()
            pino.title = "Sapiranga"
            pino.coordinate = localizacaoEncontrada.location!.coordinate
            
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 3000 , 3000)
            
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
        }
    }
    
    func localizarAluno () {
        if let aluno = aluno {
            Localizacao().converteEnderecoEmCordenadas(endereco: (aluno.endereco)!) { [self] localizacaoEncontrada in
                let pino = confugurarPino(aluno.nome!, localizacaoEncontrada)
                self.mapa.addAnnotation(pino)
            }
        }
        
    }

}
