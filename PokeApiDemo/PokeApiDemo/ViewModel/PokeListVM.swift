//
//  PokeListVM.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 30/05/21.
//

import SwiftUI
import Combine

class PokeListVM: ObservableObject {
    
    @Published var pokemonList: [Pokemon] = []
    @Published var errorMessage: String = Constant.empty
    
    @Published var showAlert: Bool? = false
    
    func getPokemon() {
        HttpWebService.consumeService(baseUrl: Service.baseUrl) { response in
            switch response {
            case .success(let data):
                let response = data.deserialize(type: Response.self)?.results
                self.pokemonList = response!.enumerated().map { (index, element) in
                    return Pokemon(id: index + 1, name: element.name?.capitalized, image: nil)
                }
            case .error(let error):
                print(error)
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
