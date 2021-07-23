//
//  WeaknessesController.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 22/07/21.
//

import UIKit

extension DetailsController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonSelected?.weaknesses.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeaknessesCollectionViewCell.weakIndetifier, for: indexPath) as! WeaknessesCollectionViewCell
        
        cell.weaknesses = pokemonSelected?.weaknesses[indexPath.row]
        cell.changeWeaknessesView()
        
            return cell
    }

}
