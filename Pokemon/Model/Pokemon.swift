//
//  Pokemons.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 05/06/21.
//

import UIKit
import Foundation

struct Pokemon1: Codable {
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
    var name: String?
    var typeColor: [String]
    var image: String?
    var nameURl: String?
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



