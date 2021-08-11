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
        return pokemons.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier , for: indexPath) as! PokemonCollectionViewCell
        
        cell.alterarNome(nome: pokemons[indexPath.row].name ?? "")
        cell.index = indexPath.row
        cell.downloadImage()
//       cell.customizeNib(with: customPokemons[indexPath.row])
        
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
