//
//  travelPackagesCollectionViewCell.swift
//  AluraViagens
//
//  Created by Michel dos Santos on 22/02/21.
//

import UIKit

class travelPackagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var placeName: UILabel!
    @IBOutlet var daily: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var imagePlace: UIImageView!
    
    func setup(travel: PacoteViagem){
        placeName.text = travel.travel.titulo
        daily.text = "\(travel.travel.quantidadedeDias)"
        price.text = "\(travel.travel.preco)"
        imagePlace.image = UIImage(named: travel.travel.caminhoDaImagem)
        
    }
    
    
}
