//
//  ContentView.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 29/05/21.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @ObservedObject var viewModel = PokeListVM()
    @ObservedObject var viewModelFavorite = FavoriteVM()
    @State var selection: Int? = nil
    @State var selectionTwo: Int? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: UIImage(named: "pokemon")!)
                      .resizable()
                      .scaledToFit()
                      .frame(height: 100.0)
                      .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    NavigationLink(destination: FavoriteView(), tag: 1, selection: $selectionTwo) {
                        Button(action: {
                            self.selectionTwo = 1
                            }) {
                                Text("My Favorites")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.leading, 16)
                                    .frame(height: 25)
                            Image(systemName: "arrow.right")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding()
                        }.background(Color.yellow)
                             .cornerRadius(25)
                             .padding(16)
                }
                ZStack {
                    List(self.viewModel.pokemonList){ pokemon in
                        NavigationLink (destination: PokeDetail(pokemon: pokemon)){
                            RowView(pokemon: pokemon)
                                .onAppear {
                                    if  (pokemon == viewModel.pokemonList.last) &&
                                            !(viewModel.endPagination) {
                                        self.viewModel.getPokemon(20, offset: viewModel.pokemonList.count)
                                    }
                                }
                        }
                    }
                        VStack {
                                   Spacer()

                                   HStack {
                                       Spacer()
                                    NavigationLink(destination: Card( listPokemon: self.viewModel.pokemonList), tag: 1, selection: $selection) {
                                       Button(action: {
                                        self.selection = 1
                                        print("action")
                                       }, label: {
                                           Text("✔︎")
                                           .font(.system(.largeTitle))
                                           .frame(width: 77, height: 70)
                                           .foregroundColor(Color.white)
                                           .padding(.bottom, 7)
                                       })
                                       .background(Color.blue)
                                       .cornerRadius(38.5)
                                       .padding()
                                       .shadow(color: Color.black.opacity(0.3),
                                               radius: 3,
                                               x: 3,
                                               y: 3)
                                   }
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
            Spacer()

        }
          .navigationBarTitle("Test", displayMode: .inline)
                   .background(NavigationConfigurator { nc in
                       nc.navigationBar.barTintColor = UIColor.blue
                       nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        })
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
