//
//  AddItemViewController.swift
//  eggplantAlura
//
//  Created by Michel dos Santos on 18/02/21.
//

import UIKit

protocol addItemDelegate {
    func add(_ item:Item)
}

class AddItemViewController: UIViewController {

    //MARK: -IBOutlets
    @IBOutlet var nameItemTextField: UITextField?
    @IBOutlet var caloriesItemTextField: UITextField?
    
    //MARK: Attributes
    
    var delegate: addItemDelegate?
    
    init(delegate:addItemDelegate ) {
        super.init(nibName: "AddItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItem(_ sender: UIButton){
        guard let name = nameItemTextField?.text else { return }
        guard let calories = caloriesItemTextField?.text else { return }
        guard let numberCalories = Double(calories) else {return}
        let item = Item(nome: name, calorias: numberCalories)
        delegate?.add(item)
        
        navigationController?.popViewController(animated: true)
    }



}
