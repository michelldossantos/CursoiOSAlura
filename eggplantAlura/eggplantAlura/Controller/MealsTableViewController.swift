//
//  MealsTableViewController.swift
//  eggplantAlura
//
//  Created by Michel dos Santos on 16/02/21.
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealsDelegate {
    
    var meals: [Meals] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meals = MealDao().recoverMeals()
       
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
        
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetail(gesture:)))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    func add(_ meal: Meals){
        meals.append(meal)
        tableView.reloadData()
        MealDao().saveMeal(meals)
   
    }
    
    @objc func showDetail(gesture: UIGestureRecognizer){
        if gesture.state == .began{
            let cell = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: cell) else {return}
            let meal =  meals[indexPath.row]
            alert(meal, indexPath: indexPath)
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? AddMealsViewController{
            viewController.delegate = self
        }
    }
    
    
    func alert(_ meal: Meals, indexPath: IndexPath){
        
        RemoveViewController.init(controller: self).showAlert(meal: meal) { alert in
            self.meals.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
    }
    
    func removeMeal(){
        print("removendo")
    }
    
    
}
