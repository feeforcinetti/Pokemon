//
//  EvolutionTableViewCell.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 29/06/21.
//

import UIKit

class EvolutionTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var pokemonNameLbl: UILabel!
    @IBOutlet var TipsPower: [UILabel]!
    @IBOutlet weak var viewSpace: UIView!
    
    var evolution: Evolution?
    
    static let identifier = "EvolutionTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "EvolutionTableViewCell", bundle: nil)
    }
    
    func setupTableViewEvolution(){
        pokemonImg.image = evolution?.image
        pokemonNameLbl.text = evolution?.name
        
        for i in 0 ... (TipsPower.count - 1) {
            let type = TipsPower.first { label in label.tag == i
            }
            type?.backgroundColor = evolution?.typeColor[i]
            type?.text = evolution?.types[i]
        }
        hideTypsEvolution()
    }
    
    func hideTypsEvolution() {
        for i in 0 ... (TipsPower.count - 1) {
            if (TipsPower[i].text == "") {
                TipsPower[i].isHidden = true
            } else {
                TipsPower[i].isHidden = false 
            }
        }
    }

    
}
