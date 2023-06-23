//
//  Quote.swift
//  QuotesOfFamousPeople
//
//  Created by Elif İlay KANDEMİR on 23.06.2023.
//

import Foundation

struct Quote{
    
    let text: String
    let author: String
    let gender : Gender
    
    enum Gender {
        
        case male
        case female
        case none
    }
}

