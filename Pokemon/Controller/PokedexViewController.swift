//
//  PokedexViewController.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 02/06/21.
//

import UIKit

class PokedexViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - IBActions
    
    @IBAction func backLoginEvolution(segue: UIStoryboardSegue) {
    }
    
//    var customPokemons: [Pokemon] =
//        [Pokemon(pokeBack: green3 , pokeNumber: "#001", pokeName: "Bulbassaruo", types: ["Grass", "Poison", ""], typeColors: [green4, green4, green4], pokeImage: UIImage(named: "001"), evolution: [Evolution(types: ["Grass", "Poison", ""], name: "Ivyssauro", typeColor: [green4, green4, green4], image: UIImage(named: "002")), Evolution(types: ["Grass", "Poison", ""], name: "Venossauro", typeColor: [green4, green4, green4], image: UIImage(named: "003"))], about: About(height: "lalal", weight: "kkk", gender: "ppp", category: "1234", Abilities: "jajja", description: "Só pra ver se funfa"), weaknesses: [Weaknesses(typesWeaknesses: "Grass", color: green4), Weaknesses(typesWeaknesses: "Eletric", color: yellow4), Weaknesses(typesWeaknesses: "Fire", color: orange4)]),
//         Pokemon(pokeBack: green3, pokeNumber: "#002", pokeName: "Ivyssauro", types: ["Grass", "Poison", "" ], typeColors: [green4, green4, green4], pokeImage: UIImage(named: "002"), evolution: [Evolution(types: ["Grass", "Poison", ""], name: "Venossauro", typeColor: [green4, green4, green4], image: UIImage(named: "003"))], about: About(height: "deu", weight: "quase", gender: "caguei", category: "555", Abilities: "010101", description: "Se deu certo ta bagua")),
//         Pokemon(pokeBack: green3, pokeNumber: "#003", pokeName: "Venossauro", types: ["Grass", "Poison", ""], typeColors:[ green4, green4, green4], pokeImage: UIImage(named: "003")),
//         Pokemon(pokeBack: orange3, pokeNumber: "#004", pokeName: "Charmander", types: ["Fire", "", ""], typeColors: [orange4, orange4, orange4], pokeImage: UIImage(named: "004"), evolution: [Evolution(types: ["", "Fire", ""], name: "Charmeleon", typeColor: [orange4, orange4, orange4], image: UIImage(named: "005")), Evolution(types: ["", "Fire", ""], name: "Charizard", typeColor: [orange4, orange4, orange4], image: UIImage(named: "006"))]),
//         Pokemon(pokeBack: orange3, pokeNumber: "#005", pokeName: "Charmeleon", types: ["Fire", "", ""], typeColors: [orange4, orange4, orange4], pokeImage: UIImage(named: "005")),
//         Pokemon(pokeBack: orange3, pokeNumber: "#006", pokeName: "Charizard", types: ["Fire", "Flying", ""], typeColors: [orange4,  orange4,  orange4], pokeImage: UIImage(named: "006")),
//         Pokemon(pokeBack: blue3, pokeNumber: "#007", pokeName: "Squirtle", types:  ["Water", "", ""], typeColors: [blue4, blue4, blue4], pokeImage: UIImage(named: "007")),
//         Pokemon(pokeBack: blue3, pokeNumber: "#008", pokeName: "Wartotle", types: ["Water", "", ""], typeColors: [blue4, blue4, blue4], pokeImage: UIImage(named: "008")),
//         Pokemon(pokeBack: blue3, pokeNumber: "#009", pokeName: "Blastoise",types: ["Water", "", ""], typeColors: [blue4, blue4,  blue4], pokeImage: UIImage(named: "009")),
//         Pokemon(pokeBack: yellow3, pokeNumber: "#010", pokeName: "Pikachu", types: ["Eletric", "", ""], typeColors: [yellow4, yellow4, yellow4], pokeImage: UIImage(named: "025")),
//         Pokemon(pokeBack: yellow3, pokeNumber: "#011", pokeName: "Raichu", types: ["Eletric", "", ""], typeColors: [yellow4, yellow4, yellow4], pokeImage: UIImage(named: "026"))]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PokemonCollectionViewCell.nib(), forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        getData()
    }
}

extension PokedexViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        //Passa dados de uma tela para outra
        if let viewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailsController {
//            viewController.pokemonSelected = customPokemons[indexPath.row]
            viewController.modalPresentationStyle = .overFullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
}

extension PokedexViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier , for: indexPath) as! PokemonCollectionViewCell
        
//        cell.customizeNib(with: customPokemons[indexPath.row])
//
        return cell
    }
    
    func getData() {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=500"
        
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            print("Go data: \(data)")
        }
        task.resume()
    }

}
