//
//  travelDetailViewController.swift
//  AluraViagens
//
//  Created by Michel dos Santos on 24/02/21.
//

import UIKit

class travelDetailViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var imagePackageTravel: UIImageView!
    @IBOutlet weak var labelTitlePackageTravel: UILabel!
    @IBOutlet weak var labelDescriptionPackageTravel: UILabel!
    @IBOutlet weak var labelDateTravel: UILabel!
    @IBOutlet weak var labelPricePackageTravel: UILabel!
    @IBOutlet weak var textFieldDate: UITextField!
    @IBOutlet weak var scrollViewDetail: UIScrollView!
    
    //MARK: IBAction
    @IBAction func buttonBack(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionTextFieldDate(_ sender: UITextField) {

        let datePickerView = UIDatePicker()
        datePickerView.preferredDatePickerStyle = UIDatePickerStyle.wheels
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
    }
    
    @IBAction func actionCorfirmPayment(_ sender: UIButton) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ConfirmsPayment") as! ConfirmsPaymentViewController
        guard let package = package else {return}
        controller.package = package
        
                        self.navigationController?.pushViewController(controller, animated: true)

        
    }
    
    //MARK: Properties
    var package: PacoteViagem? = nil
    
    var packageSelected: PacoteViagem? = nil
    
    
    //MARK: Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
     
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(increaseScroll(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        setup()
        
    }
    
    //MARK: Funcs
    @objc func increaseScroll(notification:Notification){
        self.scrollViewDetail.contentSize = CGSize(width: self.scrollViewDetail.frame.width, height: self.scrollViewDetail.frame.height + 320)
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
