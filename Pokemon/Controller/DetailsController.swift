//
//  WSegmentedControl.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 21/06/21.
//

import UIKit
import WMSegmentControl

class DetailsController: UIViewController {
    
    //MARK: - OutletsVc
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet var typesLb: [UILabel]!
    @IBOutlet weak var numberLb: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet var background: UIView!
    
        //MARK: - OutletsXib
    @IBOutlet weak var segmentedControl: WMSegment!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var evolutionsView: UIView!
    @IBOutlet weak var weaknessesView: UIView!
    @IBOutlet weak var EvolutionTableView: UITableView!

    //variaveis
    var pokemonSelected: Pokemon?
        
    var evolutions = Evolution(types: ["Grass", "Poison", ""], name: "Ivissauro", typeColor: [green4, green4, green4], image: UIImage(named: "002")!)

    //funcoes de ciclo de vida
    
    override func viewDidLoad() {
        setupSegmented()
        EvolutionTableView.register(EvolutionTableViewCell.nib(), forCellReuseIdentifier: EvolutionTableViewCell.identifier)
        changeScreen()
        
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
        pokeImage.image = pokemonSelected?.pokeImage
        background.backgroundColor = pokemonSelected?.pokeBack
        
        for i in 0 ... (pokemonSelected?.types.count ??  -1) {
            let typeLabel = typesLb.first { label in
                label.tag == i
            }
            typeLabel?.backgroundColor = pokemonSelected?.typeColors[i]
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

    
}


