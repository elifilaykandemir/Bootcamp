//
//  main.swift
//  HW3
//
//  Created by Elif İlay KANDEMİR on 31.05.2023.
//

import Foundation

struct Mine {
    var name: String
    var price: Float
}

struct MineSize {
    var name : String
    var effect: Float
}


var grainSpeciality : [Int:MineSize] = [1:MineSize(name: "Erik",effect: 0.15),
                                        2:MineSize(name: "Portakal",effect: 0.10),
                                        3:MineSize(name: "Karpuz", effect: 0)]

var mineDict : [String:Mine] = ["DMR":Mine(name: "Demir", price: 1500),
                                "KRM":Mine(name: "Krom", price: 5000),
                                "BKR":Mine(name: "Bakır", price: 3000),
                                "KMR":Mine(name: "Kömür", price: 500)]

class MineSelling {

    var amount: Float = 1
    var cleaningRatio: Float = 1
    var mineCode: String = ""
    var mineSize: Int = 0
    
    func grainEffect() -> Float{
        return (mineDict[mineCode]?.price ?? 0) - ((grainSpeciality[mineSize]?.effect ?? 0 ) * (mineDict[mineCode]?.price ?? 0))
    }
    
    func calculateBasePrice() -> Float{
        return mineDict[mineCode]?.price ?? 0 * amount
    }
    
    func cleanEffect() -> Float{
        return (mineDict[mineCode]?.price ?? 0) - ((mineDict[mineCode]?.price ?? 0) * (cleaningRatio / 100 ))
    }
    
    func calculateKDV()-> Float{
        calculateOverallPrice() * 0.08
    }
    
    func calculateOverallUnitPrice() ->Float{
        return grainEffect() - cleanEffect()
    }
    
    func calculateOverallPrice()-> Float{
        return calculateOverallUnitPrice() * amount
    }
    
    func calculateGeneralPrice() ->Float{
        return calculateOverallPrice() + calculateKDV()
    }
}

func controlCode(_ sentence:String)-> String{
    var mineCode: String
        repeat {
            print(sentence,terminator: " ")
            mineCode = (readLine() ?? "").uppercased()
            if !mineDict.keys.contains(mineCode) {
                print("The mine code doesn't exist in the list. Please enter a valid code.")
            }
        } while !mineDict.keys.contains(mineCode)
        
        return mineCode
}

func readStringToConsole(_ sentence: String) ->String{
    var trimmedInput:String
    var isAlpha: Bool
    var isEmpty: Bool
    var input: String
    repeat{
        print(sentence,terminator: " ")
        input = readLine() ?? " "
        trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        isAlpha = trimmedInput.allSatisfy{$0.isLetter}
        isEmpty = trimmedInput.isEmpty
        if isEmpty || !isAlpha {
            print("Invalid input please try again")

        }
    } while !isAlpha || isEmpty
    return trimmedInput
}

func readIntegerToConsole(_ sentence:String)-> Int {
    
    var trimmedInput:String
    var isNumeric:Bool
    var input: String
    repeat{
        print(sentence,terminator: " ")
        input = readLine() ?? " "
        trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        isNumeric = trimmedInput.allSatisfy{$0.isNumber}
        if trimmedInput.isEmpty || !isNumeric {
            print("Invalid input please try again")
            
        }
    } while trimmedInput.isEmpty || !isNumeric
    
    return Int(trimmedInput) ?? 0
}

func main(){
    let programme = MineSelling()
    print("*** Cevher v1.0 ***\n")
    let consumerName = readStringToConsole("* Müşteri'nin\nAdı:")
    let consumerSurname = readStringToConsole("Soyadı:")
    programme.mineCode = controlCode("* Cevherin\nKodu:")
    programme.mineSize = readIntegerToConsole("Tane Büyüklüğü:")
    programme.cleaningRatio = Float(readIntegerToConsole("Temizlik Oranı:"))
    programme.amount = Float(readIntegerToConsole("Miktar (ton): "))
    print("\n-------------------------------------------------\n")
    print("***********Fatura*********\n")
    print("Alıcı: \(consumerName) \(consumerSurname)\n")
    print("Cevher türü: \(String(describing: mineDict[programme.mineCode]?.name ?? ""))")
    print("Normal Birim Fiyat: \(String(describing: mineDict[programme.mineCode]?.price ?? 0)) TON/TL")
    print("Tane: \(String(describing: grainSpeciality[programme.mineSize]?.name ?? "")) (-%\(Int(grainSpeciality[programme.mineSize]!.effect * 100)))")
    print("\(grainSpeciality[programme.mineSize]!.name) Fiyat: \(programme.grainEffect()) TON/TL")
    print("Temizlik: %\(Int(programme.cleaningRatio )), Etkisi:-\(programme.cleanEffect()) TL")
    print("Temizlik Etkisi Sonrası\nBirim Fiyat: \(programme.calculateOverallUnitPrice()) TON/TL")
    print("Toplam: \(programme.calculateOverallPrice()) TL")
    print("KDV (%8): \(programme.calculateKDV()) TL")
    print("Genel Toplam: \(programme.calculateGeneralPrice()) TL")
    print("""
          
          Mega Madencilik, 2016
          ************************
    """)
}
main()
