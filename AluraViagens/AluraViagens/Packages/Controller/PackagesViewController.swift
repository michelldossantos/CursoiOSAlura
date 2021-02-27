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
    let arrayAllViagens:[PacoteViagem] = PackagesTravelsDao().retornaTodasAsViagens()
    var arrayViagens: [PacoteViagem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayViagens = arrayAllViagens
        labelNumberOfPackges.text = updateContLabelNumberPackages()
        collecttionTravelPackages.dataSource = self
        collecttionTravelPackages.delegate = self
        searchTravel.delegate = self
        
    }
    
    func updateContLabelNumberPackages() -> String{
        return arrayViagens.count == 1 ? "1 pacote encontrado" : "\(arrayViagens.count) pacotes encontrados"
        
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
    
    
}

extension PackagesViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellWidth = collecttionTravelPackages.bounds.width / 2
//        return CGSize(width: cellWidth - 15 , height: 160)
        
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? CGSize(width: collectionView.bounds.width / 2 - 20, height: 160) : CGSize(width: collectionView.bounds.width / 3 - 20, height: 250)
    }
}


extension PackagesViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let package = arrayViagens[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "travelDetailViewController") as! travelDetailViewController
        controller.package = package
//        self.present(controller, animated: true)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension PackagesViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        arrayViagens = arrayAllViagens
        if !searchText.isEmpty{
            arrayViagens = arrayAllViagens.filter{ $0.nameHotel.contains(searchText)}
        }
        labelNumberOfPackges.text = updateContLabelNumberPackages()
        collecttionTravelPackages.reloadData()
    }
}
