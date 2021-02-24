//
//  PackagesViewController.swift
//  AluraViagens
//
//  Created by Michel dos Santos on 22/02/21.
//

import UIKit

class PackagesViewController: UIViewController {
    @IBOutlet weak var collecttionTravelPackages: UICollectionView!
    @IBOutlet weak var searchTravel: UISearchBar!
    @IBOutlet weak var labelNumberOfPackges: UILabel!
    let arrayAllViagens:[Viagem] = ViagemDao().retornaTodasAsViagens()
    var arrayViagens: [Viagem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayViagens = arrayAllViagens
        labelNumberOfPackges.text = updateContLabelNumberPackages()
        collecttionTravelPackages.dataSource = self
        collecttionTravelPackages.delegate = self
        searchTravel.delegate = self
        
    }
}


extension PackagesViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "travelPackagesCollectionViewCell", for: indexPath) as! travelPackagesCollectionViewCell
        
        cell.layer.borderWidth = 0.8
        cell.layer.borderColor =  UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        cell.layer.cornerRadius = 10
        cell.setup(travel: arrayViagens[indexPath.row])
        return cell
    }
    func updateContLabelNumberPackages() -> String{
        return arrayViagens.count == 1 ? "1 pacote encontrado" : "\(arrayViagens.count) pacotes encontrados"
        
    }
    
}

extension PackagesViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collecttionTravelPackages.bounds.width / 2
        return CGSize(width: cellWidth - 15 , height: 160)
    }
}

extension PackagesViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        arrayViagens = arrayAllViagens
        if !searchText.isEmpty{
            arrayViagens = arrayAllViagens.filter{ $0.titulo.contains(searchText)}
        }
        labelNumberOfPackges.text = updateContLabelNumberPackages()
        collecttionTravelPackages.reloadData()
    }
}
