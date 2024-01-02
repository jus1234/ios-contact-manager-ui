//
//  ContactList.swift
//  ios-contact-manager-ui
//
//  Created by 장우석 on 1/2/24.
//

import Foundation

struct ContactList {
    private var contactList: Array<Contact>
    
    init() {
        self.contactList = []
    }
    
    public func showContactList() -> Array<Contact> {
        return contactList
    }
}
