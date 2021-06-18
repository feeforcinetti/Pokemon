//
//  ViewController.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 18/05/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    var customizeScreen = [Tela(background: backOrange, circleView: orange2, pokemonView: UIImage(named: "Charmander.png")),
                           Tela(background: backGreen, circleView: green2, pokemonView: UIImage(named: "Bulbasaur.png")),
                           Tela(background: backBlue, circleView: blue2, pokemonView: UIImage(named: "Squirtle.png")),
                           Tela(background: backYellow, circleView: yellow2, pokemonView: UIImage(named: "Pikachu.png"))]
                               
    //MARK: - IBOutlets
    
    @IBOutlet weak var circleView: UIImageView!
    @IBOutlet weak var pokeballCircleView: UIImageView!
    @IBOutlet weak var ballIcon: UIImageView!
   //MARK: - IBActions
    
    @IBAction func loginButton(_ sender: Any) {
        
    }
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        ballIcon.image = ballIcon.image?.withRenderingMode(.alwaysTemplate)
        ballIcon.tintColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        circleView.layer.cornerRadius = circleView.frame.height / 2
        pokeballCircleView.layer.cornerRadius = pokeballCircleView.frame.height / 2
        changeScreen(with: customizeScreen[indexRandomico()])
        timer()
    }
    
    func timer() {
        _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(mudarTela), userInfo: nil, repeats: true)
    }

    func indexRandomico() -> Int {
        let randomIndex = Int(arc4random_uniform(UInt32(customizeScreen.count)))
        return randomIndex
    }
    
    func changeScreen(with screen: Tela) {
        view.backgroundColor = screen.background
        circleView.backgroundColor = screen.circleView
        pokeballCircleView.image = screen.pokemonView
    }
    
    @objc func mudarTela() {
        changeScreen(with: customizeScreen[indexRandomico()])
    }
    
    @IBAction func backLogin(segue: UIStoryboardSegue) {
    }
}
    


