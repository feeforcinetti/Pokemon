//
//  WSegmentedControl.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 21/06/21.
//

import UIKit
import WMSegmentControl

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
    @IBOutlet weak var genderLb: UILabel!
    @IBOutlet weak var categoryLb: UILabel!
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
        changeScreen()
        changeAboutInfo()
    }
    
    // funcoes proprias
    
    func setupSegmented() {
        segmentedControl.SelectedFont = UIFont(name: "Helvetica-Bold", size: 17) ?? UIFont.boldSystemFont(ofSize: 17)
        segmentedControl.normalFont = UIFont(name: "Helvetica-Bold", size: 17) ?? UIFont.boldSystemFont(ofSize: 17)
        segmentedControl.selectorColor   = blueDetails
        segmentedControl.selectorType = .bottomBar
        segmentedControl.bottomBarHeight = 2
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
    
    func changeScreen() {
        nameLb.text = pokemonSelected?.pokeName
        numberLb.text = pokemonSelected?.pokeNumber
//        pokeImage.image = pokemonSelected?.pokeImage
//        background.backgroundColor = pokemonSelected?.pokeBack
        
        guard let pokemon = pokemonSelected else {
            return
        }
        for i in 0 ... (pokemon.types.count - 1) {
            let typeLabel = typesLb.first { label in
                label.tag == i
            }
//            typeLabel?.backgroundColor = pokemonSelected?.typeColors[i]
            typeLabel?.text = pokemonSelected?.types[i]
        }
        hideTypes()
    }
    
    func hideTypes() {
        for i in 0 ... (typesLb.count - 1) {
            if (typesLb[i].text == "") {
                typesLb[i].isHidden = true
            } else {
                typesLb[i].isHidden = false
            }
        }
    }

    func changeAboutInfo(){
        heightLb.text = pokemonSelected?.about?.height
        weightLb.text = pokemonSelected?.about?.weight
        genderLb.text = pokemonSelected?.about?.gender
        categoryLb.text = pokemonSelected?.about?.category
        abilitiesLb.text = pokemonSelected?.about?.Abilities
        descriptionLb.text = pokemonSelected?.about?.description
    }
}


