//
//  WeaknessesCollectionViewCell.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 22/07/21.
//

import UIKit

class WeaknessesCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var weaknessesView: UIView!
    @IBOutlet weak var weaknessesLb: UILabel!
    
    
    var weaknesses: Weaknesses?
    
    static let weakIndetifier = "WeaknessesCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.heightAnchor.constraint(equalToConstant: 36).isActive = true
   
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "WeaknessesCollectionViewCell", bundle: nil)
    }
    
    func changeWeaknessesView() {
//        weaknessesLb.text = weaknesses?.typesWeaknesses
//        weaknessesView.backgroundColor = weaknesses?.color
   }
}

