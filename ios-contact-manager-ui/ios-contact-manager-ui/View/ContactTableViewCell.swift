//
//  ContactTableViewCell.swift
//  ios-contact-manager-ui
//
//  Created by 장우석 on 1/3/24.
//

import UIKit

final class ContactTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let detailButton: UIButton = {
        let button = UIButton(type: .detailDisclosure)
        return button
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 1
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContactTableViewCell {
    func setupStackView() {
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(detailButton)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(phoneNumberLabel)
    }
    
    func setConstraints() {
        setNameLabelConstraints()
        setStackViewConstraints()
        setDetailButtonConstraints()
    }
    
    func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 13)
        ])
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: self.detailButton.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.detailButton.bottomAnchor)
        ])
    }
    
    func setDetailButtonConstraints() {
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailButton.leadingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: 10),
            detailButton.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            detailButton.heightAnchor.constraint(equalToConstant: 10)

        ])
    }
}
