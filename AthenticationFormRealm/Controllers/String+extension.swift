//
//  String+extension.swift
//  AthenticationFormRealm
//
//  Created by EMP on 13/10/2023.
//

import Foundation
import UIKit


extension String {
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPhone: Bool {
        let phoneRegex = "^[0-9]{10}$";
        let valid = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return valid.evaluate(with: self)
    }
    
    var isPasswordValid: Bool{
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
}
