//
//  UITextFieldExtension.swift
//  Cafe
//
//  Created by Кирилл  Геллерт on 28.11.2021.
//

import UIKit

extension UITextField {
    
    func addOnlyBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = #colorLiteral(red: 0.8310931921, green: 0.8312582374, blue: 0.8424424529, alpha: 1)
        borderStyle = .none
        layer.addSublayer(bottomLine)
        layer.masksToBounds = true
    }
    
}
