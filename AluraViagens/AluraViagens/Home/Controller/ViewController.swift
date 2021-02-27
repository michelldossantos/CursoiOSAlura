//
//  ViewController.swift
//  AluraViagens
//
//  Created by Michel dos Santos on 20/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlet
    @IBOutlet weak var tableViagens: UITableView!
    @IBOutlet weak var viewHoteis: UIView!
    @IBOutlet weak var viewPackages: UIView!
    
    let arrayViagens:[Viagem] = ViagemDao().retornaTodasAsViagens()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViagens.dataSource = self
        tableViagens.delegate = self
        viewHoteis.layer.cornerRadius = 10
        viewPackages.layer.cornerRadius = 10
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell", for: indexPath) as! ViagemTableViewCell
        let viagem = arrayViagens[indexPath.row]
        cell.setup(viagem)
        
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }
}



