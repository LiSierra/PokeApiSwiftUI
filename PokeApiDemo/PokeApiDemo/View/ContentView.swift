//
//  ContentView.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 29/05/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PokeListVM()
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: UIImage(named: "pokemon")!)
                      .resizable()
                      .scaledToFit()
                      .frame(height: 120.0)
                      .padding(10)
                List(self.viewModel.pokemonList){ pokemon in
                    NavigationLink (destination: PokeDetail(pokemon: pokemon)){
                        RowView(pokemon: pokemon)
                    }
                                              
                }
                    .listRowBackground(Color.white)
                            .onAppear {
                                if self.viewModel.pokemonList.isEmpty {
                                    self.viewModel.getPokemon()
                                }
                    }
        
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
              )

        }
          .background(Color.white)
          .navigationBarTitle("Test", displayMode: .large)
          .navigationBarHidden(false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
