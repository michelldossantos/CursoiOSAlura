//
//  Localizacao.swift
//  Agenda
//
//  Created by Michel dos Santos on 17/05/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MapKit

class Localizacao: NSObject, MKMapViewDelegate {
    
    func converteEnderecoEmCordenadas(endereco: String, local: @escaping(_ local: CLPlacemark) -> Void ) {
        let conversor = CLGeocoder()
        conversor.geocodeAddressString(endereco) { listaDeLocalicacoes, Error in
            if let localizacao = listaDeLocalicacoes?.first{
                local(localizacao)
            }
        }
    }
    
    func confugurarPino(_ titulo: String, _ localizacao: CLPlacemark, cor: UIColor?, icone: UIImage?) -> Pino {
        
        let pino = Pino(coordenada: localizacao.location!.coordinate)
        pino.title = titulo
        pino.color = cor
        pino.icone = icone
        
        return pino
    }
    func configuraBotaoDeLocalizacaoAtual(mapa: MKMapView) -> MKUserTrackingButton {
        let button = MKUserTrackingButton(mapView: mapa)
        button.frame.origin.x = 10
        button.frame.origin.y = 10
        
        return button
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is Pino {
            let annotationView = annotation as! Pino
            var pinoView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationView.title!) as? MKMarkerAnnotationView
            pinoView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: annotationView.title)
            
            pinoView?.annotation = annotationView
            pinoView?.glyphImage = annotationView.icone
            pinoView?.markerTintColor = annotationView.color
            
            return pinoView
        }
        
        return nil
    }
    
    

}
