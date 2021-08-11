//
//  PokemonCollectionViewCell.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 02/06/21.
//

import UIKit
import Kingfisher

class PokemonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet var tipLabels: [UILabel]!
    
    static let identifier = "PokemonCollectionViewCell"
    var index = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
		
		contentView.translatesAutoresizingMaskIntoConstraints = false
		contentView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.size.width - 54) / 2).isActive = true
    }

    static func nib() -> UINib {
        return UINib(nibName: "PokemonCollectionViewCell", bundle: nil)
    }
    
    func alterarNome(nome: String) {
        nameLabel.text = nome.capitalized
    }
    
    func downloadImage() {
        
        index += 1
        var numberString = String(index)
        
        // - 1 - se o numero tiver 1 digito voce adiciona 00
        // 2 - se o numero tivr 2 digitos voce adiciona 0
        // 3- se o numero tiver + de 2 diigitos vc nao faz nada
        if (index >= 1) && (index < 10){
            numberString = "00" + numberString
        }else if (index >= 10) && (index < 100) {
            numberString = "0" + numberString
        }
        
        numberLabel.text = "#" + numberString
        
        let url = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(numberString).png")
        pokemonImage.kf.setImage(with: url)
        }
   

    // Altera as caracteristicas da Nib
//    func customizeNib(with pokemon: Pokemon) {
//        numberLabel.text = pokemon.pokeNumber
//        nameLabel.text = pokemon.pokeName
////        pokemonImage.image = pokemon.pokeImage
////        self.backgroundColor = pokemon.pokeBack
//
//        for i in 0 ... (pokemon.types.count - 1) {
//            let typeLabel = tipLabels.first { label in
//                label.tag == i
//            }
////            typeLabel?.backgroundColor = pokemon.typeColors[i]
//            typeLabel?.text = pokemon.types[i]
//        }
//        hideTypes()
//    }
    
    // Esconde os labels se não tiverem texto
    func hideTypes() {
        for i in 0 ... (tipLabels.count - 1) {
            if (tipLabels[i].text == "") {
                tipLabels[i].isHidden = true
            } else {
                tipLabels[i].isHidden = false
            }
        }
    }
}
