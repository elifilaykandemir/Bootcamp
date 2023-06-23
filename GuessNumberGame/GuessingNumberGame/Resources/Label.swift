//
//  Label.swift
//  Instagram
//
//  Created by Elif İlay KANDEMİR on 9.05.2023.
//

import UIKit

class Label : UILabel {
    
    init(labelText : String? ,labelFontNamed: String="AppleGothic" ,labelFontSize: CGFloat = 20,labelNumberOfLines: Int = 1,labelTextColor: UIColor = .red) {
        super.init(frame: CGRect.zero)
        text = labelText
        font = UIFont(name: labelFontNamed, size: labelFontSize)
        numberOfLines = labelNumberOfLines
        textAlignment = .center
        textColor = labelTextColor
        sizeToFit()
      }
      
      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          
      }
}
