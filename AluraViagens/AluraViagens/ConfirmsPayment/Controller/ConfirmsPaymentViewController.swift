//
//  ConfirmsPaymentViewController.swift
//  AluraViagens
//
//  Created by Michel dos Santos on 26/02/21.
//

import UIKit

class ConfirmsPaymentViewController: UIViewController {

    //MARK: IBOutlet
    
    @IBOutlet var imageTravel:UIImageView!
    @IBOutlet var labelNamePackage: UILabel!
    @IBOutlet var labelHotelPackage: UILabel!
    @IBOutlet var labelDatePackage: UILabel!
    @IBOutlet var labelqtdPersonPackage: UILabel!
    @IBOutlet var labelDescriptionackage: UILabel!
    @IBOutlet var outletButtonBack: UIButton!
    
    //MARK: IBAction
    @IBAction func buttonBack(_ sender: UIButton) {
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    //Mark: Properties
    var package: PacoteViagem? = nil
    
    //MARK: Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        if let package = package {
            imageTravel.layer.cornerRadius = 10
            imageTravel.layer.masksToBounds = true
            imageTravel.image = UIImage(named: package.travel.caminhoDaImagem)
            labelNamePackage.text = package.travel.titulo.uppercased()
            labelHotelPackage.text = package.nameHotel
            labelDatePackage.text = package.dateTravel
            labelDescriptionackage.text = package.descriptionPackage
            outletButtonBack.layer.cornerRadius = 8 
            
        }
        
    }
 

}
