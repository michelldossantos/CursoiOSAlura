//
//  PackagesViewController.swift
//  AluraViagens
//
//  Created by Michel dos Santos on 22/02/21.
//

import UIKit

class PackagesViewController: UIViewController {
    @IBOutlet weak var collecttionTravelPackages: UICollectionView!
    let arrayViagens:[Viagem] = ViagemDao().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collecttionTravelPackages.dataSource = self
        collecttionTravelPackages.delegate = self

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
        let cellWidth = collecttionTravelPackages.bounds.width / 2
        return CGSize(width: cellWidth - 15 , height: 160)
    }
}
