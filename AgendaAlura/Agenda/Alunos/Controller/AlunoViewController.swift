//
//  AlunoViewController.swift
//  Agenda
//
//  Created by Ândriu Coelho on 24/11/17.
//  Copyright © 2017 Alura. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 13.0, *)
class AlunoViewController: UIViewController, imagePickerFotoSelecionada {
    
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
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arredondaView()
        self.setup()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScrollView(_:)), name: .UIKeyboardWillShow, object: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - Atributos
    
    let imagePiker = ImagePicker()
    
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    var aluno: Aluno?
    
    // MARK: - Métodos
    
    func arredondaView() {
        self.viewImagemAluno.layer.cornerRadius = self.viewImagemAluno.frame.width / 2
        self.viewImagemAluno.layer.borderWidth = 1
        self.viewImagemAluno.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func aumentarScrollView(_ notification:Notification) {
        self.scrollViewPrincipal.contentSize = CGSize(width: self.scrollViewPrincipal.frame.width, height: self.scrollViewPrincipal.frame.height + self.scrollViewPrincipal.frame.height/2)
    }
    
    func setup() {
        imagePiker.delegate = self
        guard let alunoSelecionado = aluno else { return  }
        textFieldNome.text = alunoSelecionado.nome
        textFieldNota.text = "\(alunoSelecionado.nota)"
        textFieldSite.text = alunoSelecionado.site
        textFieldEndereco.text = alunoSelecionado.endereco
        textFieldTelefone.text = alunoSelecionado.telefone
        imageAluno.image = alunoSelecionado.foto as? UIImage
        
    }
    
    func mostrarMultimidia(_ opcao: MenuOpcoes){
        
        let multimidia = UIImagePickerController()
        multimidia.delegate = imagePiker
        
        if opcao == .camera && UIImagePickerController.isSourceTypeAvailable(.camera) {
            multimidia.sourceType = .camera
        } else {
            multimidia.sourceType  = .photoLibrary
        }
       
        self.present(multimidia, animated: true, completion: nil)
        
    }
    
    //MARK: - Delegates
    func imagePickerFotoSelecionada(_ foto: UIImage) {
        imageAluno.image = foto
    }
    
    // MARK: - IBActions
    
    @IBAction func buttonFoto(_ sender: UIButton) {
        
        let menu = imagePiker.menuDeOpcoes { (opcao) in
            self.mostrarMultimidia(opcao)
        }
        self.present(menu, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func stepperNota(_ sender: UIStepper) {
        self.textFieldNota.text = "\(sender.value)"
    }
    
    @IBAction func btnSalvar(_ seder: UIButton) {
  
        if aluno == nil {
            aluno = Aluno(context: contexto)
        }
        
        aluno?.nome = textFieldNome.text
        aluno?.endereco = textFieldEndereco.text
        aluno?.telefone = textFieldTelefone.text
        aluno?.site = textFieldSite.text
        aluno?.nota = (textFieldNota.text! as NSString).doubleValue
        aluno?.foto = imageAluno.image

              do {
                  try contexto.save()
                  navigationController?.popViewController(animated: true)
              } catch {
                  print(error.localizedDescription)
              }
    }
    
    
}
