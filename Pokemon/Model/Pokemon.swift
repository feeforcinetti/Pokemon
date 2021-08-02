//
//  Pokemons.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 05/06/21.
//

import UIKit
import Foundation

struct Pokemon: Codable {
    var pokeBack: String
    var pokeNumber: String
    var pokeName: String
    var types: [String]
    var typeColors: [String]
    var pokeImage: String?
    var evolution: [Evolution] = []
    var about: About? = nil
    var weaknesses: [Weaknesses] = []
    

}

struct Evolution: Codable {
    var types: [String]
    var name: String
    var typeColor: [String]
    var image: String?
}

struct About: Codable {
    var height: String?
    var weight: String?
    var gender: String?
    var category: String?
    var Abilities: String?
    var description: String?
}

struct Weaknesses: Codable {
    var typesWeaknesses: String
    var color: String
}

struct PokedexModel: Codable {
    var count : Int
    var next: String?
    var previous: String?
    var results: [PokedexResult] = []
}

struct PokedexResult: Codable {
    var name: String?
    var url: String?
}

struct PokemonModel: Codable {
    var id: Int?
    var name: String?
    var url: String?
}

struct serverError {
    let msgError: String
    let statusCode: Int
}
