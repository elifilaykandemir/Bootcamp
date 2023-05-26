//
//  main.swift
//  odev2
//
//  Created by Elif İlay KANDEMİR on 26.05.2023.
//

import Foundation


class DepoFlo{
    
    var stok:[String:Int] = ["Ayakkabı":0,"Gozluk":0,"Canta":0]
    var urunKodNo:[String:String] = ["1":"Ayakkabı","2":"Canta","3":"Gozluk"]
    var urunKodu = 0
    var eklenenMal = 0
    var stoktanÇıkarılanToplam = 0
    var sonIslemTuru:String = ""
    
    enum islemTuru{
        case malekle
        case malcıkar
    }
    
    func depoFloMenu(_ islem:String="")->Void{
        switch islem{
        case "1":
            return malEkle()
        case "2":
            return malCıkart()
        case "3":
            return stokAra()
        case "4":
            return stokListele()
        case "5":
            return sonIslem()
        case "6":
            return cık()
        default:
            exit(0)
        }
    }
    
    func anaMenu(){
        print("""
            --- DepoFLO v1.0 ----\n
              1- Mal Ekle\n
              2- Mal Çıkar\n
              3- Stok Ara\n
              4- Stok Listele\n
              5- Son işlem\n
              6- Çık\n
    """)
        print("Secim:",terminator: " ")
        if let secim = readLine(){
            depoFloMenu(secim)
        }
    }
   
    func miktarBelirle(_ urunStok:String,_ islemturu:islemTuru){
        var miktar = 0
        if islemturu == .malcıkar{
            
            while true{
                print("Miktarı Giriniz (cıkıs icin 0): ",terminator: " ")
                if let giris = readLine(){
                    miktar = Int(giris)!
                }
                if miktar == 0{
                    stokKontrol(urunStok, miktar)
                    break
                }
                stokKontrol(urunStok, miktar)
            }
        }else if islemturu == .malekle{
            while true {
                print("Miktarı Giriniz (cıkıs icin 0): ",terminator: " ")
                if let giris = readLine(){
                    miktar = Int(giris)!
                }
               if miktar == 0{
                    print("\n\(urunStok) stoğuna toplam \(eklenenMal) adet \(urunStok) eklendi\n")
                    break
                }
                eklenenMal += miktar
                stok[urunStok]! += miktar
            }
        }
        anaMenu()
    }
    
    func stokKontrol(_ urunStok:String,_ miktar:Int) {
        if stok[urunStok]! < miktar{
            print("Stokta bu kadar yok \(stok[urunStok]!) adet kaldı...")
        } else if miktar == 0 {
            print("Stok secimi bitmistir")
            print("\(urunStok) stoğundan toplam \(stoktanÇıkarılanToplam) adet ayakkabı cıkarıldı.\n")
        } else {
            print("Stok kontrol ediliyor....")
            stok[urunStok]! = stok[urunStok]! - miktar
            stoktanÇıkarılanToplam += miktar
        }
    }
    
    func malEkle() {
        var urunsec:String = ""
        sonIslemTuru = "Mal Ekle"
        print("""
            1-Ayakkabı\n
            2-Canta\n
            3-Gozluk\n
            4-Vazgec
        """)
        
        print("\nSecim:",terminator: " ")
        
        if let secim = readLine(){
            urunsec = secim
        }
        
        switch urunsec{
        case "1":
            print("\nAyakkabı Ekleme\n")
            miktarBelirle(urunKodNo[urunsec]!,.malekle)
        case "2":
            print("\nCanta Ekleme")
            miktarBelirle(urunKodNo[urunsec]!,.malekle)
        case "3":
            print("\nGozluk Ekleme")
            miktarBelirle(urunKodNo[urunsec]!,.malekle)
        case "4":
            print("\nKullanıcı vazgecti.")
            anaMenu()
    
        default:
            print("işlem bekleniyor....")
        }
    }
   
    func malCıkart(){
        sonIslemTuru = "Mal Çıkar"
        var urunsec:String=""
        print("""
            1-Ayakkabı\n
            2-Canta\n
            3-Gozluk\n
            4-Vazgec
        """)
        print("\nSecim:",terminator: " ")
        if let secim = readLine(){
            urunsec = secim
        }
        switch urunsec{
        case "1":
            print("\nAyakkabı Çıkarma, Stok Miktarı: \(stok[urunKodNo[urunsec]!]!)\n")
            miktarBelirle(urunKodNo[urunsec]!,.malcıkar)
        case "2":
            print("\nCanta Çıkarma, Stok Miktarı: \(stok[urunKodNo[urunsec]!]!)\n")
            miktarBelirle(urunKodNo[urunsec]!,.malcıkar)
        case "3":
            print("\nGozluk Cıkarma,Stok Miktarı: \(stok[urunKodNo[urunsec]!]!)\n")
            miktarBelirle(urunKodNo[urunsec]!,.malcıkar)
        case "4":
            print("\nKullanıcı vazgecti.")
            exit(0)
            
        default:
            print("işlem bekleniyor....")
        }
    }
    
    func stokAra(){
        sonIslemTuru = "Stok Ara"
        var urun:String=""
        print("Ara:",terminator: " ")
        if let secim = readLine(){
            urun = secim
        }
        if let aranılanUrun = stok[urun]{
            print("\(urun) stok bilgisi:\(aranılanUrun) adet")
        }else{
            print("Aradığınız ürün bulunamadı")
            
        }
        anaMenu()
    }
    
    func stokListele(){
        sonIslemTuru = "Stok Listele"
        print("Ayakkabı:\(stok["Ayakkabı"]!) adet\nCanta:\(stok["Canta"]!) adet\nGozluk:\(stok["Gozluk"]!) adet")
        anaMenu()
    }
    
    func sonIslem(){
        print(sonIslemTuru)
        anaMenu()
    }
    
    func cık(){
       exit(0)
    }
}

func main(){
    let depo = DepoFlo()
    depo.anaMenu()
    
}
 main()
