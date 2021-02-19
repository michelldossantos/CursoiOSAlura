//
//  MealsTableViewController.swift
//  eggplantAlura
//
//  Created by Michel dos Santos on 16/02/21.
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealsDelegate {

    var meals = [Meals(nome: "Massa", felicidade: 5),
                 Meals(nome: "Pizza", felicidade: 10),
                 Meals(nome: "Lasanha", felicidade: 7),
                 Meals(nome: "Churrasco", felicidade: 8),]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = meals[indexPath.row].nome


        return cell
    }
    
    func add(_ meal: Meals){
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? AddMealsViewController{
            viewController.delegate = self
        }
    }


}
