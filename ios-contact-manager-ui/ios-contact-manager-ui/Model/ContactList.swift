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
        loadContacts()?.forEach { updateContactList(contact: $0) }
    }
    
    public func showContactList() -> Array<Contact> {
        return contactList.sorted(by: { $0.value.name.uppercased() < $1.value.name.uppercased() }).map { $0.value }
    }
    
    mutating public func deleteContact(contact: Contact) {
        contactList.removeValue(forKey: contact.phoneNumber)
    }
    
    mutating public func updateContactList(contact: Contact) {
        contactList[contact.phoneNumber] = contact
    }
    
    mutating private func loadContacts() -> [Contact]? {
        if let url = Bundle.main.url(forResource: "contacts", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let contacts = try decoder.decode([Contact].self, from: data)
                return contacts
            } catch {
                return nil
            }
        }
        return nil
    }
}
