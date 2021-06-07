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
    var endPagination = false
    
    init(){
        getPokemon(20, offset: 0)
    }
    
    func getPokemon(_ limit: Int, offset: Int) {
        let baseUrl = "\(Service.baseUrl)\(Service.limit)\(limit)\(Service.offset)\(offset)"
        HttpWebService.consumeService(baseUrl: baseUrl) { response in
            switch response {
            case .success(let data):
                let listManager: [Pokemon]
                let util = Util()
                let count = data.deserialize(type: Response.self)?.count ?? 0
                let response = data.deserialize(type: Response.self)?.results
                if count > self.pokemonList.count {
                        listManager = response!.enumerated().map { (index, element) in
                            let id = util.getIdPoke(url: element.url ?? Constant.empty)
                            return Pokemon(id: id, name:
                                            element.name?.capitalized,
                                           url: nil, image: nil)
                        }
                    self.pokemonList.append(contentsOf: listManager)
                } else {
                    self.endPagination = true
                }
                
            case .error(let error):
                print(error)
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
