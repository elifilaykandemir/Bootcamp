//
//  Generic.swift
//  InvestmentRobot
//
//  Created by Elif İlay KANDEMİR on 1.06.2023.
//

import Foundation


public func readValue<T>(_ sentence: String, validation: (T) -> Bool, conversion: (String) -> T?) -> T {
    var input: String
    var trimmedInput: String
    var isValid: Bool
    repeat {
        print(sentence, terminator: " ")
        input = readLine(strippingNewline: true) ?? ""
        trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        isValid = !trimmedInput.isEmpty && validation(conversion(trimmedInput) ?? "" as! T)
        if !isValid {
            print("Invalid input, please try again")
        }
    } while !isValid
    
    if let value = conversion(trimmedInput) {
        return value
    } else {
        fatalError("Failed to convert input to the desired type")
    }
}



private func convertToType<T>(_ input: String) -> T? {
    if let value = input as? T {
        return value
    }
    return nil
}
let intValue = readValue("Enter an integer:", validation: { Int($0) != nil }, conversion: { Int($0) })
