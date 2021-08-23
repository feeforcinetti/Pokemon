//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 13/08/21.
//

import Foundation

struct Pokemon: Codable {
    var name: String?
    var height: Int?
    var weight: Int?
    var abilities: [Abilities]
    var moves: [Moves]
    var types: [Types]
    var id: Int?
}

struct Abilities: Codable {
    var isHidden: Bool?
    var slot: Int?
    var ability: Ability?
    
    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case slot
        case ability
     }
}

struct Ability: Codable {
    var name: String?
    var url: String?
}


struct Moves: Codable {
    var move: Move?
}

struct Move: Codable {
    var name: String?
    var url: String?
}

struct Types: Codable {
    var type: Type
}

struct Type: Codable {
    var name: String?
    var url: String?
}

