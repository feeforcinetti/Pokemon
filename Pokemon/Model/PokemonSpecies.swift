//
//  PokemonSpecies.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 31/08/21.
//

import UIKit

struct PokemonSpecies: Codable {
    var evolutionChain: EvolutionChain
    
    enum CodingKeys: String, CodingKey {
        case evolutionChain = "evolution_chain"
     }
}

struct EvolutionChain: Codable {
    var url: String?
}

struct EvolutionChainResponse: Codable {
    let chain: Chain
    let id: Int
}

// MARK: - Chain
struct Chain: Codable {
    let evolutionDetails: [EvolutionDetail]
    let evolvesTo: [Chain]
    let species: Species
    
    enum CodingKeys: String, CodingKey {
        case evolutionDetails = "evolution_details"
        case evolvesTo = "evolves_to"
        case species
    }
}

// MARK: - EvolutionDetail
struct EvolutionDetail: Codable {
    let trigger: Species
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}
