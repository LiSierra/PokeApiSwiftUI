//
//  Constants.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 29/05/21.
//

import Foundation
 
struct Service {
    static let baseUrl       = "https://pokeapi.co/api/v2/pokemon"
    static let limit         = "?limit="
    static let baseSprite    = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions"
    static let baseImg       = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    static let generationI   = "\(baseSprite)/generation-i/red-blue/"
    static let generationII  = "\(baseSprite)/generation-ii/crystal/"
    static let generationIII = "\(baseSprite)/generation-iii/emerald/"
    static let headerKey     = "Content-Type"
    static let headerValue   = "application/json; charset=utf-8"
    static let timeout       = 5
}

struct Constant {
    static let empty   = ""
    static let png     = ".png"
    static let div     = "/"
    static let title   = "My Poke App"
    static let red     = "Red Blue"
    static let crystal = "Crystal"
    static let emerald = "Emerald"
    static let height  = "Height"
    static let weight  = "Weight"
    static let moves   = "Moves"
    static let types   = "Types"
}

