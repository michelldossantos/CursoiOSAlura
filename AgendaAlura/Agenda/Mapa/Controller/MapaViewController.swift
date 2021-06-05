//
//  MapaViewController.swift
//  Agenda
//
//  Created by Michel dos Santos on 17/05/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController, CLLocationManagerDelegate {
    
    
    //MARK OUTLET
    
    @IBOutlet weak var mapa: MKMapView!
    
    //MARK: Variaveis
    
    var aluno: Aluno?
    lazy var localizao = Localizacao()
    lazy var gerenciadorDeLocalizacao = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Localizar aluno"
        localizacaoInicial()
        localizarAluno()
        mapa.delegate = localizao
        gerenciadorDeLocalizacao.delegate = self
        verificaAutorizacaoDoUsuario()
        
        
    }
    
    
    func verificaAutorizacaoDoUsuario() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
                
            case .authorizedWhenInUse:
                let botao = Localizacao().configuraBotaoDeLocalizacaoAtual(mapa: mapa)
                mapa.addSubview(botao)
                gerenciadorDeLocalizacao.startUpdatingLocation()
                break
            case .notDetermined:
                gerenciadorDeLocalizacao.requestWhenInUseAuthorization()

                break
            case .restricted:
                break
            case .denied:
                break
            case .authorizedAlways:
                break
            }
        }
    }
    
    func localizacaoInicial () {
        Localizacao().converteEnderecoEmCordenadas(endereco: "Sapiranga - RS") { localizacaoEncontrada in
            let pino = Localizacao().confugurarPino("Sapiranga", localizacaoEncontrada, cor: .black, icone: nil)
            
            
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 3000 , 3000)
            
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
        }
    }
    
    func localizarAluno () {
        if let aluno = aluno {
            Localizacao().converteEnderecoEmCordenadas(endereco: (aluno.endereco)!) { [self] localizacaoEncontrada in
//                let pino = confugurarPino(aluno.nome!, localizacaoEncontrada)
                let pino = Localizacao().confugurarPino(aluno.nome!, localizacaoEncontrada, cor: nil, icone: nil)
                self.mapa.addAnnotation(pino)
            }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            let botao = Localizacao().configuraBotaoDeLocalizacaoAtual(mapa: mapa)
            mapa.addSubview(botao)
            gerenciadorDeLocalizacao.startUpdatingLocation()
            break
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }

}


