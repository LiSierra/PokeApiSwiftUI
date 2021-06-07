//
//  FavoriteView.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 6/06/21.
//

import SwiftUI
import CoreData

struct FavoriteView: View {
    @ObservedObject var viewModel = FavoriteVM()
    
    var body: some View {
        List(self.viewModel.manager, id: \.self){ pokemon in
            Text(pokemon.value(forKey: "name") as? String ?? "")
                .font(.body)
                .foregroundColor(Color(hex: "#AED6F1"))
                .fontWeight(.bold)
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
