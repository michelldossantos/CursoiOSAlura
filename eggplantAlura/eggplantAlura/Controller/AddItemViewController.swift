//
//  AddItemViewController.swift
//  eggplantAlura
//
//  Created by Michel dos Santos on 18/02/21.
//

import UIKit

class AddItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItem(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }



}
