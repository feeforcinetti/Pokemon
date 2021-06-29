//
//  PokedexViewController.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 02/06/21.
//

import UIKit

class PokedexViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var customPokemons: [Pokemon] = [Pokemon(pokeBack: green3 , pokeNumber: "#001", pokeName: "Bulbassaruo", types: ["Grass", "Poison", ""], typeColors: [green4, green4, green4], pokeImage: UIImage(named: "001")),
                                     Pokemon(pokeBack: green3, pokeNumber: "#002", pokeName: "Ivyssauro", types: ["Grass", "Poison", "" ], typeColors: [green4, green4, green4], pokeImage: UIImage(named: "002")),
                                     Pokemon(pokeBack: green3, pokeNumber: "#003", pokeName: "Venossauro", types: ["Grass", "Poison", ""], typeColors:[ green4, green4, green4], pokeImage: UIImage(named: "003")),
                        Pokemon(pokeBack: orange3, pokeNumber: "#004", pokeName: "Charmander", types: ["Fire", "", ""], typeColors: [orange4, orange4, orange4], pokeImage: UIImage(named: "004")),
                        Pokemon(pokeBack: orange3, pokeNumber: "#005", pokeName: "Charmeleon", types: ["Fire", "", ""], typeColors: [orange4, orange4, orange4], pokeImage: UIImage(named: "005")),
                        Pokemon(pokeBack: orange3, pokeNumber: "#006", pokeName: "Charizard", types: ["Fire", "Flying", ""], typeColors: [orange4,  orange4,  orange4], pokeImage: UIImage(named: "006")),
                        Pokemon(pokeBack: blue3, pokeNumber: "#007", pokeName: "Squirtle", types:  ["Water", "", ""], typeColors: [blue4, blue4, blue4], pokeImage: UIImage(named: "007")),
                        Pokemon(pokeBack: blue3, pokeNumber: "#008", pokeName: "Wartotle", types: ["Water", "", ""], typeColors: [blue4, blue4, blue4], pokeImage: UIImage(named: "008")),
                        Pokemon(pokeBack: blue3, pokeNumber: "#009", pokeName: "Blastoise",types: ["Water", "", ""], typeColors: [blue4, blue4,  blue4], pokeImage: UIImage(named: "009")),
                        Pokemon(pokeBack: yellow3, pokeNumber: "#010", pokeName: "Pikachu", types: ["Eletric", "", ""], typeColors: [yellow4, yellow4, yellow4], pokeImage: UIImage(named: "025")),
                        Pokemon(pokeBack: yellow3, pokeNumber: "#011", pokeName: "Raichu", types: ["Eletric", "", ""], typeColors: [yellow4, yellow4, yellow4], pokeImage: UIImage(named: "026"))]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PokemonCollectionViewCell.nib(), forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
			flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
}

extension PokedexViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension PokedexViewController: UICollectionViewDataSource{
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customPokemons.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier , for: indexPath) as! PokemonCollectionViewCell
        
        cell.customizeNib(with: customPokemons[indexPath.row])
        
        return cell
    }
}
