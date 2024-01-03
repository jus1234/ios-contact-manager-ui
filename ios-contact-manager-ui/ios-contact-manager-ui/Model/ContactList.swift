//
//  ContactList.swift
//  ios-contact-manager-ui
//
//  Created by 장우석 on 1/2/24.
//

import Foundation

struct ContactList {
    private var contactList: Dictionary<String, Contact>
    
    init() {
        self.contactList = [:]
    }
    
    public func showContactList() -> Array<Contact> {
        return contactList.sorted(by: { $0.value.name < $1.value.name }).map { $0.value }
    }
    
    mutating public func deleteContact(contact: Contact) {
        contactList.removeValue(forKey: contact.phoneNumber)
    }
    
    mutating public func updateContactList(contact: Contact) {
        contactList[contact.phoneNumber] = contact
    }
}
