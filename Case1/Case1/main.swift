//
//  main.swift
//  Case1
//
//  Created by Elif İlay KANDEMİR on 24.05.2023.
//

import Foundation

import Foundation

var otUcret: [String: Float] = [:]
var tazelikKaybı:[String: Float] = ["Kekik":0.1,"Nane":0.2,"Fesleğen":0.1,"Reyhan":0.4]

class Ot{
    
    var otIsmi:String
    var otMiktar:Float
    var ucret:Float
    var taze:Int
    
    
    
    init(otIsmi:String,ucret:Float,taze:Int,otMiktar:Float) {
        self.otIsmi = otIsmi
        self.ucret = ucret
        self.taze = taze
        self.otMiktar = otMiktar
    }
    
    func tazelikEtkisi()->Int{

        return taze == 0 ? Int((tazelikKaybı[otIsmi]!)*Float(islemTutar())) : 0
    }

    func tazelikBirimFiyatEtkisi()->Int{
        return taze == 0 ? Int(ucret - (tazelikKaybı[otIsmi]!)*ucret) : Int(ucret)
        
    }

    
    func islemTutar()->Int{
        return Int(ucret*otMiktar)
    }
    
    func tutar()->Int{
        return Int(islemTutar()-tazelikEtkisi())
    }
    
    func kdvHesapla()->Int{
        return Int(Float(tutar())*0.18)
        
    }
    
    func genelToplam()->Int{
        return tutar()+kdvHesapla()
    }
    
   
}

enum GırısHatası: Error {
    case gecersizGiris
}

func ucretKontrolu(_ input: String){
    let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if trimmedInput.isEmpty {
        print("Boş değer giremez.. Program sonlandırılıyor")
        exit(0)
    }
    
    do {
        guard let intValue = try Int(trimmedInput) else {
            throw GırısHatası.gecersizGiris
        }
    } catch GırısHatası.gecersizGiris {
        print("Geçersiz değer girisi yapıldı program sonlandırılıyor.")
        exit(0)
    } catch {
        print("Bilinmeyen bir hata oluştu... Program sonlandırlıyor")
        exit(0)
    }
    
}


func main(){
    var ottur: String = ""
    var otfiyat : Float = 0
    var tazemi : Int = 1
    var otmiktar : Float = 0
    
    print("** Ot Master v1.0 ***\n")
    print("Kg başı ot fiyatlarını giriniz:\n")
    print("Kekik:",terminator: " ")
    if let kekikUcret = readLine(){
        ucretKontrolu(kekikUcret)
        otUcret["Kekik"] = Float(kekikUcret)
    }
    print("Nane:",terminator: " ")
    if let naneUcret = readLine(){
        ucretKontrolu(naneUcret)
        otUcret["Nane"] = Float(naneUcret)
    }
    print("Fesleğen:",terminator: " ")
    if let feslegenUcret = readLine(){
        ucretKontrolu(feslegenUcret)
        otUcret["Fesleğen"] = Float(feslegenUcret)
       
    }
    print("Reyhan:",terminator: " ")
    if let reyhanUcret = readLine() {
        ucretKontrolu(reyhanUcret)
        otUcret["Reyhan"] = Float(reyhanUcret)
    }

    print("**************************\n")

    print("Tür:",terminator: " ")
    if let tur = readLine() {
        ottur = tur
        otfiyat = Float(otUcret[tur]!)
        
    }

    print("-\(ottur)- miktar (kg): ",terminator: " ")
    if let miktar = readLine() {
        otmiktar = Float(miktar)!
        
    }
    
    print("Taze mi? (1=taze): ",terminator: " ")
    if let taze = readLine() {
        tazemi = Int(taze)!
        
    }
    
    let ot = Ot(otIsmi: ottur, ucret: otfiyat, taze: tazemi, otMiktar: otmiktar)
    
    print("İşlem Tutar: \(ot.islemTutar())")
    if tazemi == 0{
        print("Tazelik Etkisi: -\(ot.tazelikEtkisi())")
    }else{print("Tazelik Etkisi: 0")}
    
    print("Tutar: \(ot.tutar())")
    print("Kdv(%18): \(ot.kdvHesapla())")
    
    print("\nFatura: \n\n---------------------------\n\nOT A.Ş")
    if tazemi == 1{
        print("\n* Nane: \(Int(otmiktar))(kg) x \(ot.tazelikBirimFiyatEtkisi())TL = \(ot.tutar())\nTaze.")
    }else{print("* Nane: \(Int(otmiktar))(kg) x \(ot.tazelikBirimFiyatEtkisi())TL = \(ot.tutar())\nTaze Değil.")}
    print("Kdv(%18): \(ot.kdvHesapla()) TL")
    print("Genel Toplam: \(ot.genelToplam()) TL")
}

main()
