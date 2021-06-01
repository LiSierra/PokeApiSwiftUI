//
//  StatsRow.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 1/06/21.
//

import SwiftUI

struct StatsRow: View {
    var statKey: String
    var statValue: String
    var body: some View {
        HStack(alignment:.center) {
            Text(statKey + ":")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding(.leading, 40)
                .foregroundColor(Color.gray)
            Text(statValue)
                .font(.system(size: 15))
                .fontWeight(.ultraLight)
                .padding(.trailing, 40)
                .foregroundColor(Color.gray)
                
            Spacer()
        }.minimumScaleFactor(0.5)
    }
}

struct StatsRow_Previews: PreviewProvider {
    static var previews: some View {
        StatsRow(statKey: "Edad", statValue: "34")
    }
}

