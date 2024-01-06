//
//  ContactsTableView.swift
//  ios-contact-manager-ui
//
//  Created by 장우석 on 1/6/24.
//

import UIKit

class ContactsTableView: UIView {
    let tableView: UITableView
    private let contactModel: ContactList
    private var contactArray: Array<Contact>
    
    override init(frame: CGRect) {
        self.tableView = UITableView()
        self.contactModel = ContactList()
        self.contactArray = contactModel.showContactList()
        super.init(frame: frame)
        setupTableView()
        backgroundColor = .white
        addSubview(tableView)
        setupTableViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContactsTableView {
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactCell")
    }

    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
    }
}


