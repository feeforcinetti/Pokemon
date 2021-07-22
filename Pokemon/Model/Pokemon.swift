//
//  Pokemons.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 05/06/21.
//

import UIKit

struct Pokemon {
    var pokeBack: UIColor
    var pokeNumber: String
    var pokeName: String
    var types: [String]
    var typeColors: [UIColor]
    var pokeImage: UIImage?
    var evolution: [Evolution] = []
    var about: About? = nil
}

struct Evolution {
    var types: [String]
    var name: String
    var typeColor: [UIColor]
    var image: UIImage?
}

struct About {
    var height: String?
    var weight: String?
    var gender: String?
    var category: String?
    var Abilities: String?
    var description: String?
}
