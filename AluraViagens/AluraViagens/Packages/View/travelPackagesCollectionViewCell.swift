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
    
    func setup(travel: Viagem){
        placeName.text = travel.titulo
        daily.text = "5"
        price.text = travel.preco
        imagePlace.image = UIImage(named: travel.caminhoDaImagem)
        
    }
    
    
}
