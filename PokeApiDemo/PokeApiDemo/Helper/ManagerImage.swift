//
//  ManagerImage.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 29/05/21.
//

import Foundation

import SwiftUI

class ManagerImage: ObservableObject {
    @Published private(set) var data: Data?
    
    func getImage(id: Int,
                  url: String = Constant.empty) {
        
        let url = "\(url)\(id)\(Constant.png)"
        
        do {
            self.data = try Data(contentsOf: URL(string: url)!)
        } catch {
            print("Error")
        }
    }
}
