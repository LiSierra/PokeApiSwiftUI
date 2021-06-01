//
//  PokeDetailVM.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 1/06/21.
//

import SwiftUI

class PokeDetailVM: ObservableObject {
    @Published var detail: PokemonDetail?
    var pokemon: Pokemon
    
    init(pokemon: Pokemon){
        self.pokemon = pokemon
    }
    
    func getDetail(){
        let url = "\(Service.baseUrl)\(Constant.div)\(pokemon.id!)"
        HttpWebService.consumeService(baseUrl: url) { response in
            switch response {
            case .success(let data):
                self.detail = data.deserialize(type: PokemonDetail.self)
                self.detail?.name = self.detail?.name.capitalized ?? Constant.empty
            case .error(let error):
                print(error)
            }
        }
    }
}
