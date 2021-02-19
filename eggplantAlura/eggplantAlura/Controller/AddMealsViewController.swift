//
//  ViewController.swift
//  eggplantAlura
//
//  Created by Michel dos Santos on 16/02/21.
//

import UIKit

protocol AddMealsDelegate{
    func add(_ meal: Meals)
}

class AddMealsViewController: UIViewController, addItemDelegate {
   
    
    
    // MARK: IBOutlet
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet var itemsTableView: UITableView?
    
    //MARK: VAR
    var delegate: AddMealsDelegate?
    var items = [Item(nome: "Massa", calorias: 300.0),
                 Item(nome: "Tomate", calorias: 433),
                 Item(nome: "Queijo", calorias: 67),
                 Item(nome: "Salame", calorias: 45.0)]
    
    var selecteditems:[Item] = []
    
    //MARK: Cicle Life
    
    override func viewDidLoad(){
        let button = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(addItem))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func addItem(){
        let addItemViewController = AddItemViewController(delegate: self)
        navigationController?.pushViewController(addItemViewController, animated: true)
    }
    
    func add(_ item: Item) {
        items.append(item)
        itemsTableView?.reloadData()
    }
    
    //MARK: IBAction
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Meals(nome: nomeDaRefeicao, felicidade: felicidade,items: selecteditems)
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension AddMealsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = items[indexPath.row].nome
        return cell
    }
}

extension AddMealsViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        if cell.accessoryType == .none{
            cell.accessoryType = .checkmark
            selecteditems.append(items[indexPath.row])
            
        }else{
            
            cell.accessoryType = .none
            if let position = selecteditems.firstIndex(of: items[indexPath.row]){
                selecteditems.remove(at: position)
            }
        }
    }
}
