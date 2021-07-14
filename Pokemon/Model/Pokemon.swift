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
}

struct Evolution {
    var types: [String]
    var name: String
    var typeColor: [UIColor]
    var image: UIImage
}
