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
    var pokemon: Pokemon? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.size.width - 54) / 2).isActive = true
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PokemonCollectionViewCell", bundle: nil)
    }
    
    func setupPokemon(pokemon: PokemonsResult) {
        alterarNome(nome: pokemon.name)
        getUrl(url: pokemon.url)
    }
    
    func getUrl(url: String?) {
        let newUrl = url
        getDataPokemonModel(urlString: newUrl ?? "")
    }
    
    func alterarNome(nome: String?) {
        nameLabel.text = nome?.capitalized
    }
    
    func downloadImage() {
        
        index += 1
        var numberString = String(index)
        
        if (index >= 1) && (index < 10){
            numberString = "00" + numberString
        }else if (index >= 10) && (index < 100) {
            numberString = "0" + numberString
        }
        
        numberLabel.text = "#" + numberString
        
        let url = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(numberString).png")
        pokemonImage.kf.setImage(with: url)
    }
    
    func trocarCorFundo() {
        guard let type = pokemon?.types.first?.type.name else { return }
        DispatchQueue.main.async {
            self.backgroundColor = UIColor().getTypeColor(type: type)
            
            for i in 0...(self.tipLabels.count - 1) {
                self.tipLabels[i].backgroundColor = UIColor().getTypeColor(type: type).darker(by: 10.0)
            }
        }
    }
    
//    func selectTypes() {
//        for i in 0...(tipLabels.count - 1) {
//            let typeLabel = tipLabels.first { label in
//                         label.tag == i
//            }
//            guard let type = pokemon?.types[i].type.name else {return}
//            typeLabel?.text = type
//        }
//    }
    
    // Altera as caracteristicas da Nib
//    func customizeNib(with pokemon: Pokemon) {
//        for i in 0 ... (pokemon.types.count - 1) {
//            let typeLabel = tipLabels.first { label in
//                label.tag == i
//            }
//            typeLabel?.text = pokemon.types[i].name
//        }
//        //        for i in 0 ... (pokemon.types.count - 1) {
//        //            let typeLabel = tipLabels.first { label in
//        //                label.tag == i
//        //            }
//        ////            typeLabel?.backgroundColor = pokemon.typeColors[i]
//        //            typeLabel?.text = pokemon.types[i]
//        //        }
//        //        hideTypes()
//        //    }
//    }
//
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
        
        func getDataPokemonModel(urlString: String) {
            guard let url = URL(string: urlString) else {
                return
            }
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do{
                    let decoder = JSONDecoder() //Criando decodificador
                    let respostaDaApi = try decoder.decode(Pokemon.self, from: data) // decoficou Json para model
                    print("Sucess: \(respostaDaApi)")
                    self.pokemon = respostaDaApi
                    self.trocarCorFundo()
                }catch {
                    print("Erro ao Formatar retorno")
                }
            }
            task.resume()
        }
}
