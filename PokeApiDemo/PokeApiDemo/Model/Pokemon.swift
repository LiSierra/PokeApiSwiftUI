//
//  Pokemon.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 30/05/21.
//

import Foundation

struct Pokemon: Identifiable, Hashable, Codable {
    var id: Int?
    let name: String?
    let image: Data?
    var isLike: Bool?
    
}

struct Response: Codable {
    let count: Int
    let results: [Pokemon]
}
