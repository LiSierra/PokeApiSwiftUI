//
//  ImageViewContainer.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 29/05/21.
//

import SwiftUI
import Combine

struct ImageViewContainer: View {
    private var data: Data?
    
    var stateContent: AnyView {
            if let data = data, let image = UIImage(data: data) {
                return AnyView(
                    Image(uiImage: image)
                        .resizable()
                        .clipShape(Circle())
                                    .background(Circle()
                                    .foregroundColor(Color.black.opacity(0.2)))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 3.0))
                        .frame(width: 80.0, height: 80.0)
                )
            }
        return AnyView(Blinking().frame(width: 100, height: 100)
                        .foregroundColor(.yellow))
        }
        
        init(with data: Data?){
            self.data = data
        }
        
        func image (from data: Data) -> UIImage {
            UIImage(data: data) ?? UIImage()
        }
    
    var body: some View {
            HStack {
                stateContent
            }
        }
}
