//
//  Contact.swift
//  ios-contact-manager-ui
//
//  Created by 장우석 on 1/2/24.
//

import Foundation

struct Contact {
    var name: String
    var age: Int
    var phoneNumber: String
    
    init(name: String, age: Int, phoneNumber: String) {
        self.name = name
        self.age = age
        self.phoneNumber = phoneNumber
    }
}
