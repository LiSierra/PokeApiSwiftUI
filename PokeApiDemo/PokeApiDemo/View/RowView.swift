//
//  RowView.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 29/05/21.
//

import SwiftUI

struct RowView: View {
    var pokemon: Pokemon
    @ObservedObject var manager = ManagerImage()
    
    init(pokemon: Pokemon) {
            self.pokemon = pokemon
        }
    
    var body: some View {
        HStack(alignment: .center) {
            ImageViewContainer(with: self.manager.data)
            Text(pokemon.name ?? Constant.empty)
                .foregroundColor(Color.gray)
                .font(.system(size: 30))
                .padding(.leading, 16)
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
          )
          .background(Color.clear)
          .onAppear {
                self.manager.getImage(id: self.pokemon.id!,
                                      url: Service.baseImg)
          }
    }
}

