//
//  Model.swift
//  InvestmentRobot
//
//  Created by Elif İlay KANDEMİR on 1.06.2023.
//

import Foundation

struct Currency {
    var dolar: Int
    var avro: Int
    var gold: Int
    var silver: Int
    var interest: Int
    var bitcoin: Int
}

struct Exchange{
    var type : String
    var rate: Float
    var persentageOfIncrease: Int
    var probalityOfInterest: Int
}

struct Invesment {
    var type: String
    var sum: Float
    var profit : Float
    
}


