//
//  EvolutionDetailController.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 02/07/21.
//

import UIKit

extension DetailsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let EvolutionCell = EvolutionTableView.dequeueReusableCell(withIdentifier: EvolutionTableViewCell.identifier , for: indexPath) as! EvolutionTableViewCell
        
        return EvolutionCell
        
    }
    
    func setupTableViewEvolution(){
    
    }
}
