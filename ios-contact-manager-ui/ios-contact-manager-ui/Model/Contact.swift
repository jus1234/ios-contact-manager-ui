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
    var contact: String
    
    init(name: String, age: Int, contact: String) {
        self.name = name
        self.age = age
        self.contact = contact
    }
}
