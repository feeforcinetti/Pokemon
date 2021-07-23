//
//  WeaknessesCollectionViewCell.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 22/07/21.
//

import UIKit

class WeaknessesCollectionViewCell: UICollectionViewCell {

    var weaknesses: Weaknesses?
    
    static let weakIndetifier = "WeaknessesCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "WeaknessesCollectionViewCell", bundle: nil)

    }

}
