//
//  Extensions.swift
//  Instagram
//
//  Created by Elif İlay KANDEMİR on 11.02.2023.
//

import Foundation
import UIKit

extension UIView{
    var top: CGFloat{
        frame.origin.y
    }
    var bottom: CGFloat{
        frame.origin.y+height
    }
    var left: CGFloat{
        frame.origin.x
    }
    var right: CGFloat{
        frame.origin.x+width
    }
    var width: CGFloat{
        frame.size.width
    }
    var height: CGFloat{
        frame.size.height
    }
}

extension DateFormatter{
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}
extension String {
    static func date(from date: Date) -> String {
        let formatter = DateFormatter.formatter
        let string = formatter.string(from: date)
        return string
    }
}
