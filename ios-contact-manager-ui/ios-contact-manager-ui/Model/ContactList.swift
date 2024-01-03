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
        contactList["010-2223-1111"] = Contact(name: "SDii", age: 87, phoneNumber: "010-2223-1111")
        contactList["010-2224-1111"] = Contact(name: "Siid", age: 86, phoneNumber: "010-2224-1111")
        contactList["010-2225-1111"] = Contact(name: "SiDi", age: 67, phoneNumber: "010-2225-1111")
        contactList["010-2226-1111"] = Contact(name: "DsIi", age: 12, phoneNumber: "010-2226-1111")
        contactList["010-2227-1111"] = Contact(name: "IISS", age: 22, phoneNumber: "010-2227-1111")
        contactList["010-2228-1111"] = Contact(name: "DDDD", age: 33, phoneNumber: "010-2228-1111")
        contactList["010-2222-1112"] = Contact(name: "aaaa", age: 16, phoneNumber: "010-2222-1112")
        contactList["010-2223-1113"] = Contact(name: "bbbb", age: 52, phoneNumber: "010-2223-1113")
        contactList["010-2224-1114"] = Contact(name: "ssss", age: 24, phoneNumber: "010-2224-1114")
        contactList["010-2225-1115"] = Contact(name: "cccc", age: 29, phoneNumber: "010-2225-1115")
        contactList["010-2226-1116"] = Contact(name: "cici", age: 92, phoneNumber: "010-2226-1116")
        contactList["010-2227-1117"] = Contact(name: "cidi", age: 99, phoneNumber: "010-2227-1117")
        contactList["010-2228-1118"] = Contact(name: "Dici", age: 10, phoneNumber: "010-2228-1118")
        contactList["010-3228-1114"] = Contact(name: "sisi", age: 20, phoneNumber: "010-3224-1114")
        contactList["010-3225-1115"] = Contact(name: "cisi", age: 48, phoneNumber: "010-3225-1115")
        contactList["010-3226-1116"] = Contact(name: "sici", age: 67, phoneNumber: "010-3226-1116")
        contactList["010-3227-1117"] = Contact(name: "bici", age: 46, phoneNumber: "010-3227-1117")
        contactList["010-3228-1118"] = Contact(name: "aici", age: 91, phoneNumber: "010-3228-1118")
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
