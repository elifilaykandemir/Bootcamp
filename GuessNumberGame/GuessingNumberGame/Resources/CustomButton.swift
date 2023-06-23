//
//  CustomButton.swift
//  GuessingNumberGame
//
//  Created by Elif İlay KANDEMİR on 21.06.2023.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
    }
    
    init(title: String, color:String, fontSize:CGFloat, fontName:String,titlecolor:UIColor) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(titlecolor, for: .normal)
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont(name: fontName, size: fontSize)
        backgroundColor = UIColor(named: color)
        layer.cornerRadius = 25
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
