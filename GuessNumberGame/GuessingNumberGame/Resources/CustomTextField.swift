//
//  CustomTextField.swift
//  GuessingNumberGame
//
//  Created by Elif İlay KANDEMİR on 22.06.2023.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 1
        placeholder = " Lütfen tahmininizi giriniz"
        layer.borderColor = UIColor.secondaryLabel.cgColor
        backgroundColor = .secondarySystemBackground
        autocapitalizationType = .none
        keyboardType = .numberPad
        autocorrectionType = .no
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
