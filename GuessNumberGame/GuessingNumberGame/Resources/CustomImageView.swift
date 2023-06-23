//
//  mainView.swift
//  GuessingNumberGame
//
//  Created by Elif İlay KANDEMİR on 21.06.2023.
//

import UIKit

class CustomImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(pageImage:String) {
        super.init(frame: .zero)
        contentMode = .scaleAspectFit
        layer.masksToBounds = true
        image = UIImage(named: pageImage)
    }

  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
