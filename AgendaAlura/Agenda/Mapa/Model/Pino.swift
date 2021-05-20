//
//  Pino.swift
//  Agenda
//
//  Created by Michel dos Santos on 19/05/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MapKit

class Pino: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var icone: UIImage?
    var color: UIColor?
    
    
    init(coordenada: CLLocationCoordinate2D) {
        self.coordinate = coordenada
    }
}
