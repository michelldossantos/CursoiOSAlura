//
//  AppDelegate.swift
//  AgendaM
//
//  Created by Michel dos Santos on 08/03/21.
//

import UIKit

class AlunoViewController: UIViewController, ImagePickerFotoSelecionada {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var viewImagemAluno: UIView!
    @IBOutlet weak var imageAluno: UIImageView!
    @IBOutlet weak var buttonFoto: UIButton!
    @IBOutlet weak var scrollViewPrincipal: UIScrollView!
    
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var textFieldTelefone: UITextField!
    @IBOutlet weak var textFieldSite: UITextField!
    @IBOutlet weak var textFieldNota: UITextField!
    
    // MARK: - Atributos
    
    let imagePicker = ImagePicker()
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.arredondaView()
        self.setup()
//        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScrollView(_:)), name: .UIKeyboardWillShow, object: nil)
    }
    
    // MARK: - Métodos
    
    func setup() {
        imagePicker.delegate = self
    }
    
    func arredondaView() {
        self.viewImagemAluno.layer.cornerRadius = self.viewImagemAluno.frame.width / 2
        self.viewImagemAluno.layer.borderWidth = 1
        self.viewImagemAluno.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func aumentarScrollView(_ notification:Notification) {
        self.scrollViewPrincipal.contentSize = CGSize(width: self.scrollViewPrincipal.frame.width, height: self.scrollViewPrincipal.frame.height + self.scrollViewPrincipal.frame.height/2)
    }
    
//    func mostrarMultimidia(_ opcao:MenuOpcoes) {
//        let multimidia = UIImagePickerController()
//        multimidia.delegate = imagePicker
//        
//        if opcao == .camera && UIImagePickerController.isSourceTypeAvailable(.camera) {
//            multimidia.sourceType = .camera
//        }
//        else {
//            multimidia.sourceType = .photoLibrary
//        }
//        self.present(multimidia, animated: true, completion: nil)
//    }
    
    // MARK: - Delegate
    
    func imagePickerFotoSelecionada(_ foto: UIImage) {
        imageAluno.image = foto
    }
    
    // MARK: - IBActions
    
    @IBAction func buttonFoto(_ sender: UIButton) {
        
//        let menu = ImagePicker().menuDeOpcoes { (opcao) in
//            self.mostrarMultimidia(opcao)
//        }
//        present(menu, animated: true, completion: nil)
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let multimidia = UIImagePickerController()
            multimidia.sourceType = .camera
            multimidia.delegate = imagePicker
            self.present(multimidia, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func stepperNota(_ sender: UIStepper) {
//        self.textFieldNota.text = "\(sender.value)"
    }
    
    
}
