//
//  NumberGenerator.swift
//  GuessingNumberGame
//
//  Created by Elif İlay KANDEMİR on 22.06.2023.
//

import Foundation

class NumberGenerator {
    private let lowerBound: Int
    private let upperBound: Int
    
    init(lowerBound: Int, upperBound: Int) {
        self.lowerBound = lowerBound
        self.upperBound = upperBound
    }
    
    func generateRandomNumber() -> Int {
        return Int.random(in: lowerBound...upperBound)
    }
}
