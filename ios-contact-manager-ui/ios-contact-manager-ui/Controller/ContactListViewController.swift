//
//  ContactListViewController.swift
//  ios-contact-manager-ui
//
//  Created by 장우석 on 1/3/24.
//

import UIKit

final class ContactListViewController: UIViewController {
    
    private let tableView: UITableView
    private let contactList: ContactList
    private var contactArray: Array<Contact>
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        tableView = UITableView()
        contactList = ContactList()
        contactArray = contactList.showContactList()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTableViewConstraints()
    }

}

extension ContactListViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "ContactCell")
    }
    
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}

extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactTableViewCell
        
        contactCell.contact = contactArray[indexPath.row]
        
        return contactCell
        
    }
    
    
}
