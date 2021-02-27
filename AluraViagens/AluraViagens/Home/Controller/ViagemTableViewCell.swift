//
//  ViagemTableViewCell.swift
//  AluraViagens
//
//  Created by Michel dos Santos on 21/02/21.
//

import UIKit

class ViagemTableViewCell: UITableViewCell {
    
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labeldays: UILabel!
    @IBOutlet var labelPrice: UILabel!
    @IBOutlet var imageViagem: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(_ viagem:Viagem){
        labeldays.text =   viagem.quantidadedeDias == 1 ? "1 dia" : "\(viagem.quantidadedeDias) dias"
        labelTitle.text = viagem.titulo
        labelPrice.text = "R$ \(viagem.preco)"
        imageViagem.image = UIImage(named: viagem.caminhoDaImagem)
        imageViagem.layer.cornerRadius = 10
        imageViagem.layer.masksToBounds = true
    }

}
