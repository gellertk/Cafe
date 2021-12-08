//
//  OtherFunction.swift
//  Cafe
//
//  Created by Кирилл  Геллерт on 08.12.2021.
//

import Foundation

func isValidEmail(emailID: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: emailID)
}
