//
//  Extensions.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 29/05/21.
//

import Foundation
import SwiftUI

// MARK: - Transactions
extension AnyTransition {
    static var trailingBottomAtRemoval: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingBottomAtRemoval: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}

// MARK: - Dictionaty
extension Dictionary {
    func deserialize<T>(type: T.Type) -> T? where T: Codable {
        do {
            let data = try JSONSerialization.data(withJSONObject: self,
                                                         options: .prettyPrinted)
            return try JSONDecoder().decode(type, from: data)
        } catch let error {
            print(">> Error Get/Parese as Data Custom =\(error) !!")
        }
        return nil
    }
    
}

// MARK: - String
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
