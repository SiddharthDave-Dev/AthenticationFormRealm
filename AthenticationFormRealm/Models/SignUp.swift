//
//  UserList.swift
//  AthenticationFormRealm
//
//  Created by EMP on 13/10/2023.
//

import Foundation
import RealmSwift


class SignUp: Object {
    
    @objc dynamic var suuser = ""
    @objc dynamic var suemail = ""
    @objc dynamic var suphno = ""
    @objc dynamic var supassword = ""
    @objc dynamic var suconfirmpassword = ""
}

