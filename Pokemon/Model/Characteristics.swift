//
//  Characteristics.swift
//  Pokemon
//
//  Created by Felipe Forcinetti on 13/08/21.
//

import Foundation

struct Characteristics: Codable {
    var descriptions: String?
    var language: [language]
}

struct language: Codable {
    var name: String?
}
