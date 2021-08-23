//
//  PokedexViewController.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 02/06/21.
//

import UIKit

protocol PokedexViewControllerProtocol {
    func selectPokemon(pokemon: Pokemon?)
        
}

class PokedexViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - IBActions
    
    @IBAction func backLoginEvolution(segue: UIStoryboardSegue) {
    }
    
    var pokemons: [PokemonsResult] = []
    
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
    
    func updateCollectionView(_ respostaPkm: [PokemonsResult]) {
        pokemons = respostaPkm
        DispatchQueue.main.async {
        self.collectionView.reloadData()
        }
    }
}


extension PokedexViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let cell = collectionView.cellForItem(at: indexPath) as! PokemonCollectionViewCell
        selectPokemon(pokemon: cell.pokemon)
    }
}

extension PokedexViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier , for: indexPath) as! PokemonCollectionViewCell
        cell.delegate = self
        cell.index = indexPath.row
        cell.setupPokemon(pokemon: pokemons[indexPath.row])
        cell.downloadImage()
    
        return cell
    }
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		if let cell = collectionView.cellForItem(at: indexPath) as? PokemonCollectionViewCell {
			cell.clear()
		}
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
            
            do{
                let decoder = JSONDecoder() //Criando decodificador
                let respostaDaApi = try decoder.decode(PokedexResponse.self, from: data) // decoficou Json para model
                self.updateCollectionView(respostaDaApi.results) // Pegou o objeto decodificado e atribuiu a uma variavel global(Onde a classe toda pode ter acesso).
                print("Sucess: \(respostaDaApi)")
            }catch {
                print("Erro ao Formatar retorno")
            }
        }
        task.resume()
    }
}

extension PokedexViewController: PokedexViewControllerProtocol {
    func selectPokemon(pokemon: Pokemon?) {
        if let viewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailsController {
            viewController.pokemonSelected = pokemon
            viewController.modalPresentationStyle = .overFullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
}


