//
//  ContactListViewController.swift
//  ios-contact-manager-ui
//
//  Created by 장우석 on 1/3/24.
//

import UIKit

final class ContactListViewController: UIViewController {
    
//    private let tableView: UITableView
    private let contactTableView: ContactsTableView
    private let contactModel: ContactList
    private var contactArray: Array<Contact>
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        tableView = UITableView()
        contactTableView = ContactsTableView()
        contactModel = ContactList()
        contactArray = contactModel.showContactList()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contactTableView
        contactTableView.tableView.dataSource = self
        setupConstraints()
//        setupTableView()
//        setupTableViewConstraints()
    }
}

extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let contactCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactTableViewCell
//        let contact: Contact = contactArray[indexPath.row]
//        
//        contactCell.nameLabel.text = "\(contact.name)(\(contact.age))"
//        contactCell.phoneNumberLabel.text = contact.phoneNumber
//        contactCell.accessoryType = .disclosureIndicator
//        
//        return contactCell
        let contactCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact: Contact = contactArray[indexPath.row]
        var content = contactCell.defaultContentConfiguration()
        
        content.text = "\(contact.name)(\(contact.age))"
        content.secondaryText = contact.phoneNumber
        contactCell.contentConfiguration = content
        
        contactCell.accessoryType = .disclosureIndicator
        
        return contactCell
    }
}
//
//extension ContactListViewController {
//    private func setupTableView() {
//        tableView.dataSource = self
//        tableView.rowHeight = 50
//        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "ContactCell")
//    }
//    
//    private func setupTableViewConstraints() {
//        view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
//        ])
//    }
//}

extension ContactListViewController {
    private func setupConstraints() {
        contactTableView.translatesAutoresizingMaskIntoConstraints = false
        contactTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contactTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
