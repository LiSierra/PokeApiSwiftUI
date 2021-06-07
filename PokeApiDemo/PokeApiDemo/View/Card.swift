//
//  Card.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 6/06/21.
//

import SwiftUI

struct Card: View {
    let util = Util()
    @State var x: [CGFloat] =
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @State var degree: [Double] =
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
         0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var listPokemon: [Pokemon]
    @ObservedObject var viewModel = FavoriteVM()

    
    
    init(listPokemon: [Pokemon]) {
        self.listPokemon = listPokemon
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
            Button(action: {
                for i in 0 ..< self.x.count {
                    self.x[i] = 0
                }
                for i in 0 ..< self.degree.count {
                    self.degree[i] = 0
                }
            })
            {
               Image(systemName: "return")
                .font(.title)
            }
            ZStack {
                ForEach(0 ..< listPokemon.count, id: \.self ) { i in
                    CardDesing(pokemon: self.listPokemon[i])
                        .offset(x: self.x[i])
                        .rotationEffect(.init(degrees: self.degree[i]))
                        .gesture(DragGesture()
                                    .onChanged({value in
                                        if value.translation.width > 0 {
                                            self.x[i] = value.translation.width
                                            self.degree[i] = 8
                                        } else {
                                            self.x[i] = value.translation.width
                                            self.degree[i] = -8
                                        }
                                    })
                                    .onEnded({ value in
                                        if value.translation.width > 0 {
                                            if value.translation.width > 100 {
                                                self.x[i] = 500
                                                self.degree[i] = 15
                                                // true
                                                self.viewModel.addFavorite(name: self.listPokemon[i].name ?? Constant.empty)
                                            } else {
                                                self.x[i] = 0
                                                self.degree[i] = 0
                                            }
                                        } else {
                                            if value.translation.width < -100 {
                                                self.x[i] = -500
                                                self.degree[i] = 15
                                                // false
                                                self.viewModel.deleteFavorite(name: self.listPokemon[i].name ?? Constant.empty)
                                            } else {
                                                self.x[i] = 0
                                                self.degree[i] = 0
                                            }
                                        }
                                    })
                        )
                }
            }
            .padding()
            .animation(.default)
        }
    }
}



struct CardDesing: View {
    var pokemon: Pokemon
    @ObservedObject var manager = ManagerImage()
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.manager.getImage(id: self.pokemon.id!,
                              url: Service.baseImg)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack {
                    Image(uiImage: UIImage(data: self.manager.data!)!)
                    .resizable()
                    .frame(height: 410)
                HStack(spacing: 25) {
                    Button(action: {
                    }) {
                        Image("delete")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding()
                    }.background(Color.black.opacity(0.02))
                    .clipShape(Circle())
                    Spacer()
                    Button(action: {
                    }) {
                        Image("favorite")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding()
                    }.background(Color.black.opacity(0.02))
                    .clipShape(Circle())
                }
                .padding(10)
            }.background(Color.white)
            .cornerRadius(25)
            
            VStack(alignment: .center, spacing: 12) {
                HStack {
                    Spacer()
                    Text(pokemon.name ?? Constant.empty)
                        .font(.title)
                        .foregroundColor(Color(hex: "#AED6F1"))
                        .fontWeight(.bold)
                    Spacer()
                }
                    
                Text(String(pokemon.id ?? 0))
                    .font(.body)
                    .foregroundColor(Color(hex: "#AED6F1"))
                    .fontWeight(.bold)
            }
            .padding(.leading, 10)
            .padding(.bottom, 40)
            

        }
        
    }
}
