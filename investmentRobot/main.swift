//  ConsoleFunction.swift
//  InvestmentRobot
//
//  Created by Elif İlay KANDEMİR on 1.06.2023.
//

import Foundation

var riskTolerance : [Int:Currency] = [
    1 : Currency(dolar: 0, avro: 0, gold: 0, silver: 0, interest: 100, bitcoin: 0),
    2 : Currency(dolar: 30, avro: 30, gold: 20, silver: 20, interest: 20, bitcoin: 0),
    3 : Currency(dolar: 50, avro: 0, gold: 10, silver: 30, interest: 0, bitcoin: 10),
    4 : Currency(dolar: 30, avro: 0, gold: 0, silver: 10, interest: 0, bitcoin: 60),
    5 : Currency(dolar: 10, avro: 0, gold: 0, silver: 20, interest: 0, bitcoin: 70)
]

var exchangeTable : [String:Exchange] = [
    "dolar" : Exchange(type: "dolar", rate: 8.3, persentageOfIncrease: 50, probalityOfInterest: 20),
    "avro" : Exchange(type: "avro", rate: 10.1, persentageOfIncrease: 60, probalityOfInterest: 10),
    "gold" : Exchange(type: "gold", rate: 510, persentageOfIncrease: 40, probalityOfInterest: 14),
    "silver" : Exchange(type: "silver", rate: 7.5, persentageOfIncrease: 30, probalityOfInterest: 20),
    "interest" : Exchange(type: "interest", rate: 1, persentageOfIncrease: 100, probalityOfInterest: 15),
    "bitcoin" : Exchange(type: "bitcoin", rate: 1000, persentageOfIncrease: 20, probalityOfInterest: 25)
]

// param: Kullanıcıdan alınan risk değeri
// return: Risk duurmuna göre güncellenmiş değeri döner

func getRiskTolerance(_ userInvesmentRatio: Float , _ userAge: Int, userRiskToleranceValue: inout Int ) -> Int {
    
    switch (userInvesmentRatio, userAge) {
    case (let value, _) where value > 5:
        return userRiskToleranceValue
    case (1...5, let age) where age > 60:
        return userRiskToleranceValue - 1
    case (0.5..<1, let age) where age < 40:
        return userRiskToleranceValue
    case (0.5..<1, let age) where age <= 50 && 40 < age:
        
        if riskTolerance[userRiskToleranceValue]?.bitcoin != 0 {
            var newRate = (riskTolerance[userRiskToleranceValue]?.bitcoin ?? 0) / (5)
            for (key, _) in riskTolerance {
                riskTolerance[key]?.dolar += newRate
                riskTolerance[key]?.avro += newRate
                riskTolerance[key]?.gold += newRate
                riskTolerance[key]?.silver += newRate
                riskTolerance[key]?.interest += newRate
            }
        }
        return userRiskToleranceValue
    case (0.5..<1, let age) where age > 50:
        return userRiskToleranceValue - 1
    case (0.1..<0.5, let age) where age < 30:
        return userRiskToleranceValue
    case (0.1..<0.5, let age) where age > 30:
        return userRiskToleranceValue - 1
    case (let value, _) where value < 0.1:
        if userRiskToleranceValue == 4 || userRiskToleranceValue == 5 {
            userRiskToleranceValue = 2
        }else if userRiskToleranceValue == 3 {
            userRiskToleranceValue = 1
        }
        return userRiskToleranceValue
    default:
        return userRiskToleranceValue
    }
}

func calculateAllValue(_ risk:Int, _ invesmentAmount:Int) -> [Invesment] {
    
    var result : [Invesment] = [Invesment(type: "", sum: 0, profit: 0),Invesment(type: "", sum: 0, profit: 0),Invesment(type: "", sum: 0, profit: 0),Invesment(type: "", sum: 0, profit: 0),Invesment(type: "", sum: 0, profit: 0),Invesment(type: "", sum: 0, profit: 0)]
    result[0].sum = (Float(riskTolerance[risk]!.dolar) / 100 * Float(invesmentAmount)) / (exchangeTable["dolar"]?.rate ?? 1)
    result[0].profit = result[0].sum * Float(Float(exchangeTable["dolar"]?.persentageOfIncrease ?? 100) / 100)
    result[0].type = "Dolar"
    result[1].sum = (Float(riskTolerance[risk]!.avro) / 100 * Float(invesmentAmount)) / (exchangeTable["avro"]?.rate ?? 1)
    result[1].profit = result[1].sum * Float(Float(exchangeTable["avro"]?.persentageOfIncrease ?? 100) / 100)
    result[1].type = "Avro"
    result[2].sum = (Float(riskTolerance[risk]!.gold) / 100 * Float(invesmentAmount)) / (exchangeTable["gold"]?.rate ?? 1)
    result[2].profit = result[2].sum * Float(Float(exchangeTable["gold"]?.persentageOfIncrease ?? 100) / 100)
    result[2].type = "Gold"
    result[3].sum = (Float(riskTolerance[risk]!.silver) / 100 * Float(invesmentAmount)) / (exchangeTable["silver"]?.rate ?? 1)
    result[3].profit = result[3].sum * Float(Float(exchangeTable["silver"]?.persentageOfIncrease ?? 100) / 100)
    result[3].type = "Silver"
    result[4].sum = (Float(riskTolerance[risk]!.interest) / 100 * Float(invesmentAmount)) / (exchangeTable["interest"]?.rate ?? 1)
    result[4].profit = result[4].sum * Float(Float(exchangeTable["interet"]?.persentageOfIncrease ?? 100) / 100)
    result[4].type = "Interest"
    result[5].sum = (Float(riskTolerance[risk]!.bitcoin) / 100 * Float(invesmentAmount)) / (exchangeTable["bitcoin"]?.rate ?? 1)
    result[5].profit = result[5].sum * Float(Float(exchangeTable["bitcoin"]?.persentageOfIncrease ?? 100) / 100)
    result[5].type = "Bitcoin"
    return result
}

func calculateAllProfit(_ risk:Int, _ invesmentAmount:Int) -> Float {
    var totalProfit : Float = 0
    calculateAllValue(risk, invesmentAmount).forEach{ totalProfit += $0.profit }
    return totalProfit
    
}

func displayAllDetail(_ risk:Int, _ invesmentAmount:Int) -> [Invesment] {
    var investmentDetail = [Invesment]()
    var investmentTypes = [String]()
    var sumValues = [String]()
    var profit = [String]()
    calculateAllValue(risk, invesmentAmount).forEach{
        if $0.sum > 0 {
           investmentDetail.append($0)
        }
    }
    return investmentDetail
}

func investmentReport(_ risk:Int, _ invesmentAmount:Int) {
    var investmentDetail = displayAllDetail(risk, invesmentAmount)
    print("Yatırım değerleriniz hesaplananıyor.....")
    investmentDetail.forEach{
        print("\($0.type) bazında \($0.sum) \($0.type.lowercased()) yatırım yaptınız. Bu yatırımdan karınız:\($0.profit) \($0.type.lowercased()) ")
    }
}

// Program Executing
greetings()
var name = readString("İsim: ")
var surname = readString("Soyisim: ")
var riskToleranceValue = readInteger("Lütfen risk iştahını giriniz : ")
while riskToleranceValue > 5 {
    print("Lütfen geçerli risk iştah değeri giriniz... Bu değer 1 ile 5 arasında olmalıdır...")
    riskToleranceValue = readInteger("Lütfen risk iştahını giriniz : ")
}
var age = readInteger("Yaş: ")
var montlyIncome = readFloat("Aylık Gelir: ")
var investmentAmount = readInteger("Yatırım miktarınızı giriniz: ")
var invesmentRatio = montlyIncome / Float(investmentAmount)
var newRiskTolerance = getRiskTolerance(invesmentRatio, age, userRiskToleranceValue: &riskToleranceValue)
print("\n\n-----------Yatırım Raporu----------------\n")
print("Sayın \(name) \(surname) yapılan değerlendirmelere göre hesaplanan risk iştahınız: \(newRiskTolerance)")
var allDetail = displayAllDetail(newRiskTolerance, investmentAmount)
investmentReport(newRiskTolerance, investmentAmount)
