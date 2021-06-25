//
//  WSegmentedControl.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 21/06/21.
//

import UIKit
import WMSegmentControl

class DetailsController: UIViewController {
    
    // outlet
    @IBOutlet weak var segmentedControl: WMSegment!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var evolutionsView: UIView!
    @IBOutlet weak var weaknessesView: UIView!
    //variaveis
    
    
    //funcoes de ciclo de vida
    
    override func viewDidLoad() {
        setupSegmented()
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
}

