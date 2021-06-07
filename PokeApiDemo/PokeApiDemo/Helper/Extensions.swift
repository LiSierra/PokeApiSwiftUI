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
    
    var isNumeric : Bool {
        return NumberFormatter().number(from: self) != nil
    }
}

// MARK: - Color
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
