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
//        loadContacts()?.forEach { updateContactList(contact: $0) }
//        print(contactList)
        contactList["010-2222-1111"] = Contact(name: "Sidi", age: 88, phoneNumber: "010-2222-1111")
        contactList["010-2223-1111"] = Contact(name: "Sidi", age: 88, phoneNumber: "010-2222-1111")
        contactList["010-2224-1111"] = Contact(name: "Sidi", age: 88, phoneNumber: "010-2222-1111")
        contactList["010-2225-1111"] = Contact(name: "Sidi", age: 88, phoneNumber: "010-2222-1111")
        contactList["010-2226-1111"] = Contact(name: "Sidi", age: 88, phoneNumber: "010-2222-1111")
        contactList["010-2227-1111"] = Contact(name: "Sidi", age: 88, phoneNumber: "010-2222-1111")
        contactList["010-2228-1111"] = Contact(name: "Sidi", age: 88, phoneNumber: "010-2222-1111")
        
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
    
    mutating private func loadContacts() -> [Contact]? {
//        let fileManager = FileManager.default
//        let filePath = fileManager.currentDirectoryPath + "contacts.json"
        let filePath = "contacts.json"
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            print("yes")
            let decoder = JSONDecoder()
            let contacts = try decoder.decode([Contact].self, from: data)
            return contacts
        } catch {
            print("no")
            return nil
        }
    }
}
