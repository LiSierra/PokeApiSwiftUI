//
//  PokeDetail.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 31/05/21.
//

import SwiftUI

struct PokeDetail: View {
    @ObservedObject var pokeDetailVM: PokeDetailVM
    @ObservedObject var manager = ManagerImage()
    @ObservedObject var generationI = ManagerImage()
    @ObservedObject var generationII = ManagerImage()
    @ObservedObject var generationIII = ManagerImage()
    var pokemon: Pokemon
    
    init(pokemon: Pokemon){
        self.pokemon = pokemon
        self.pokeDetailVM = PokeDetailVM(pokemon: pokemon)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text(pokemon.name ?? Constant.empty)
                        .foregroundColor(Color.gray)
                        .fontWeight(.semibold)
                        .font(.system(size: 35))
                    ImageViewContainer(with: self.manager.data)
                        .overlay(Circle().stroke(Color.yellow, lineWidth: 3.0))
                    Spacer()
                    
                    HStack  {
                        VStack {
                            ImageViewContainer(with: self.generationI.data)
                            Text(Constant.red)
                                .foregroundColor(Color.gray)
                                .italic()
                        }
                        VStack {
                            ImageViewContainer(with: self.generationII.data)
                            Text(Constant.crystal)
                                .foregroundColor(Color.gray)
                                .italic()
                                
                        }
                        VStack {
                            ImageViewContainer(with: self.generationII.data)
                            Text(Constant.emerald)
                                .foregroundColor(Color.gray)
                                .italic()
                        }
                                   
                    }
                }
                .background(Color.white.opacity(0.5))
                .cornerRadius(25)
                .padding(20)
                Spacer()
                Group{
                    StatsRow(statKey: Constant.height, statValue: String(pokeDetailVM.detail?.height ?? 0))
                    StatsRow(statKey: Constant.weight, statValue: String(pokeDetailVM.detail?.weight ?? 0))
                    StatsRow(statKey: Constant.types, statValue: Constant.empty)
                    ScrollView(.horizontal){
                                HStack {
                                    ForEach(pokeDetailVM.detail?.types ?? [], id: \.self) { type in
                                        Spacer()
                                        Text(type.type.name)
                                            .foregroundColor(Color.gray)
                                            .italic()
                                        Spacer()
                                    }
                                }
                                .padding(.leading, 16)
                        }
                    .padding(16)
                    Spacer()
                    StatsRow(statKey: Constant.moves, statValue: Constant.empty)
                    ScrollView(.horizontal){
                                HStack {
                                    ForEach(pokeDetailVM.detail?.moves.prefix(10) ?? [], id: \.self) { move in
                                        Spacer()
                                        Text(move.move.name)
                                            .foregroundColor(Color.gray)
                                            .italic()
                                        Spacer()
                                    }
                                }.padding(.leading, 16)
                        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    .frame(height: 80.0)
                    }
                .background(Color.white.opacity(0.5))
                .cornerRadius(25)
                .padding(10)
            }
        }.onAppear {
            self.pokeDetailVM.getDetail()
            self.manager.getImage(id: self.pokemon.id!, url: Service.baseImg)
            self.generationIII.getImage(id: self.pokemon.id!, url: Service.generationIII)
            self.generationII.getImage(id: self.pokemon.id!, url: Service.generationII)
            self.generationI.getImage(id: self.pokemon.id!, url: Service.generationI)
        }
    }
}
