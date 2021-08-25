//
//  WSegmentedControl.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 21/06/21.
//

import UIKit
import WMSegmentControl
import Kingfisher

class DetailsController: UIViewController {
    
    // MARK: - OutletsVc
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet var typesLb: [UILabel]!
    @IBOutlet weak var numberLb: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet var background: UIView!
    
        // MARK: - OutletsXib
    @IBOutlet weak var segmentedControl: WMSegment!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var evolutionsView: UIView!
    @IBOutlet weak var weaknessesView: UIView!
    @IBOutlet weak var EvolutionTableView: UITableView!
    
    // MARK: OutletsAboutView
    @IBOutlet weak var heightLb: UILabel!
    @IBOutlet weak var weightLb: UILabel!
    @IBOutlet weak var movesLb: UILabel!
    @IBOutlet weak var abilitiesLb: UILabel!
    @IBOutlet weak var descriptionLb: UILabel!
    
    @IBOutlet weak var weaknessesCollectionView: UICollectionView!
    
    //variaveis
    var pokemonSelected: Pokemon?
     
    //funcoes de ciclo de vida
    
    override func viewDidLoad() {
        setupSegmented()
        weaknessesCollectionView.register(WeaknessesCollectionViewCell.nib(), forCellWithReuseIdentifier: WeaknessesCollectionViewCell.weakIndetifier)
        
        if let flowLayout = weaknessesCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        EvolutionTableView.register(EvolutionTableViewCell.nib(), forCellReuseIdentifier: EvolutionTableViewCell.identifier)
        changeAboutInfo()
        
    }
    
    // funcoes proprias
    
    func setupSegmented() {
        segmentedControl.SelectedFont = UIFont(name: "Helvetica-Bold", size: 17) ?? UIFont.boldSystemFont(ofSize: 17)
        segmentedControl.normalFont = UIFont(name: "Helvetica-Bold", size: 17) ?? UIFont.boldSystemFont(ofSize: 17)
        segmentedControl.selectorColor   = water
        segmentedControl.selectorType = .bottomBar
        segmentedControl.bottomBarHeight = 2
    }
    
    func downloadImage(_ id: Int) {
        
        var numberString = String(id)
        
        if (id >= 1) && (id < 10){
            numberString = "00" + numberString
        }else if (id >= 10) && (id < 100) {
            numberString = "0" + numberString
        }
        numberLb.text = "#" + numberString
        
        let url = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(numberString).png")
        pokeImage.kf.setImage(with: url)
    }
    
    func trocarCorFundo(_ pokemon: Pokemon) {
        guard let type = pokemon.types.first?.type.name else { return }
        DispatchQueue.main.async {
            self.background.backgroundColor = UIColor().getTypeColor(type: type)
            
            for i in 0...(self.typesLb.count - 1) {
                self.typesLb[i].backgroundColor = UIColor().getTypeColor(type: type).darker(by: 10.0)
            }
        }
    }
    
    func alterarNome(nome: String?) {
        nameLb.text = nome?.capitalized
    }
    
    func selectMoves(_ moves: [Moves]) -> String {
        var text = ""
        moves.forEach { move in
            text += (move.move?.name ?? "") + ", "
        }
        return text
    }
    
    func selectAbilities(_ abilities: [Abilities]) -> String {
        var abilitys = ""
        abilities.forEach { abilities in
            abilitys += (abilities.ability?.name ?? "") + " ,"
        }
        return abilitys
    }
    //ibaction
  
        @IBAction func detailsPokemon(_ sender: WMSegment) {
            if sender.selectedSegmentIndex == 0 {
                aboutView.isHidden = false
                evolutionsView.isHidden = true
                weaknessesView.isHidden = true
            }else if sender.selectedSegmentIndex == 1{
                aboutView.isHidden = true
                evolutionsView.isHidden = false
                weaknessesView.isHidden = true
            }else {
                aboutView.isHidden = true
                evolutionsView.isHidden = true
                weaknessesView.isHidden = false
            }
        }
    
    func selectTypes(_ pokemon: Pokemon) {
        for i in 0...(typesLb.count - 1){
            let typeLb = self.typesLb.first {
                label in label.tag == i
            }
            if !pokemon.types.isEmpty && i <= (pokemon.types.count - 1) {
                guard let type = pokemon.types[i].type.name else { return }
                typeLb?.text = type
            }
        }
        self.hideTypes()
    }
        
//        for i in 0 ... (pokemon.types.count - 1) {
//            let typeLabel = typesLb.first { label in
//                label.tag == i
//            }
//            typeLabel?.backgroundColor = pokemonSelected?.typeColors[i]
//            typeLabel?.text = pokemonSelected?.types[i]
//        }
//        hideTypes()
//    }
//
    func hideTypes() {
        for i in 0 ... (typesLb.count - 1) {
            if (typesLb[i].text == "") {
                typesLb[i].isHidden = true
            } else {
                typesLb[i].isHidden = false
            }
        }
    }
    
    func changeAboutInfo() {
        guard let pokemonSelected = pokemonSelected else { return }
        selectTypes(pokemonSelected)
        downloadImage(pokemonSelected.id ?? 0)
        trocarCorFundo(pokemonSelected)
        alterarNome(nome: pokemonSelected.name )
        heightLb.text = String(pokemonSelected.height ?? 0) + " m"
        weightLb.text = String(pokemonSelected.weight ?? 0)
        movesLb.text = selectMoves(pokemonSelected.moves).capitalized
        abilitiesLb.text = selectAbilities(pokemonSelected.abilities).capitalized
//      descriptionLb.text = pokemonSelected?.about?.description
    }
}

