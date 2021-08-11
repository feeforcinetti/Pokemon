//
//  PokedexResponse.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 09/08/21.
//

import Foundation

struct PokedexResponse: Codable {
    var count : Int
    var next: String?
    var previous: String?
    var results: [PokemonsResult] = []
}

struct PokemonsResult: Codable {
    var name: String?
    var url: String?
}
