//
//  EvolutionDetailController.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 02/07/21.
//

import UIKit

extension DetailsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return pokemonSelected?.evolution.count ?? 0
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let evolutionCell = EvolutionTableView.dequeueReusableCell(withIdentifier: EvolutionTableViewCell.identifier , for: indexPath) as! EvolutionTableViewCell
        
//        evolutionCell.evolution = pokemonSelected?.evolution[indexPath.row]
        evolutionCell.setupTableViewEvolution()
        
        
        return evolutionCell
        
    }
}
