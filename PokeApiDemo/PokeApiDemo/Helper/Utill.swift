//
//  Utill.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 6/06/21.
//

import Foundation
import UIKit

class Util {
    
    func getIdPoke(url: String) -> Int {
        let array = url.components(separatedBy: "/")
        var id = 0
        
        for value in array  {
            if value.isNumeric {
                id = Int(value) ?? 0
            }
        }
        
        return id
    }
    
    func getX(size: Int) -> [CGFloat] {
        var x: [CGFloat] = []
        var count = 0
        
        
        while count < size {
            x.insert(0, at: count)
            count += 1
        }
        
        return x
    }
    
    func getDegrees(size: Int) -> [Double] {
        var degrees: [Double] = []
        var count = 0
        
        
        while count < size {
            degrees.insert(0, at: count)
            count += 1
        }
        
        return degrees
    }
}
