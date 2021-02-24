//
//  travelDetailViewController.swift
//  AluraViagens
//
//  Created by Michel dos Santos on 24/02/21.
//

import UIKit

class travelDetailViewController: UIViewController {

    @IBOutlet weak var imagePackageTravel: UIImageView!
    @IBOutlet weak var labelTitlePackageTravel: UILabel!
    @IBOutlet weak var labelDescriptionPackageTravel: UILabel!
    @IBOutlet weak var labelDateTravel: UILabel!
    @IBOutlet weak var labelPricePackageTravel: UILabel!
    
    @IBAction func buttonBack(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    var package: PacoteViagem? = nil
    
    var packageSelected: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }
    
    private func setup(){
        guard let pacote: PacoteViagem = package else {return}
        imagePackageTravel.image = UIImage(named: "\(pacote.travel.caminhoDaImagem)")
        labelTitlePackageTravel.text = pacote.travel.titulo
        labelDescriptionPackageTravel.text = pacote.descriptionPackage
        labelDateTravel.text = pacote.dateTravel
        labelPricePackageTravel.text = pacote.travel.preco
    }
}
