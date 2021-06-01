//
//  PokemonDetail.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 1/06/21.
//

import Foundation

struct PokemonDetail: Codable {
    var name: String
    var height: Int
    var weight: Int
    var order: Int
    var types: [Types]
    var moves: [Moves]
}

struct Moves: Hashable,Codable {
    var move: MovesDetail
}

struct MovesDetail: Hashable, Codable {
    var name: String
}

struct Type: Hashable, Codable {
    var name: String
}

struct Types: Hashable, Codable {
    var type: Type
}
