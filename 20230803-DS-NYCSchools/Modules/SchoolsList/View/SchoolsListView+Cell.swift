//
//  SchoolsListView+Cell.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/6/23.
//

import UIKit

final class SchoolListTableViewCell: UITableViewCell {
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let addressLabel = UILabel()
    private let neighborhoodLabel = UILabel()
    private let phoneLabel = UILabel()
    
    func configure(
        title: String,
        address: String,
        neighborhood: String,
        phone: String
    ) {
        titleLabel.text = title
        addressLabel.text = address
        neighborhoodLabel.text = neighborhood
        phoneLabel.text = phone
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        addressLabel.text = ""
        neighborhoodLabel.text = ""
        phoneLabel.text = ""
    }
    
}

// MARK: - Setup
private extension SchoolListTableViewCell {
    
    func setup() {
        backgroundColor = .white
        setupContainerView()
        setupTitleLabel()
        setupAddressLabel()
        setupNeighborhoodLabel()
        setupPhoneLabel()
    }
    
    func setupContainerView() {
        contentView.addSubview(containerView)
        containerView
            .pin(to: contentView, withInsets: .init(top: 8, left: 16, bottom: 8, right: 16))
    }
    
    func setupTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel
            .pinWithoutBottom(to: containerView)
    }
    
    func setupAddressLabel() {
        containerView.addSubview(addressLabel)
        addressLabel.numberOfLines = 0
        addressLabel.font = UIFont.systemFont(ofSize: 14)
        addressLabel.textColor = .darkGray
        addressLabel
            .top(to: titleLabel.bottomAnchor, spacing: 4)
            .leading(to: containerView.leadingAnchor)
            .trailing(to: containerView.trailingAnchor)
    }
    
    func setupNeighborhoodLabel() {
        containerView.addSubview(neighborhoodLabel)
        neighborhoodLabel.numberOfLines = 1
        neighborhoodLabel.font = UIFont.systemFont(ofSize: 13)
        neighborhoodLabel.textColor = .black
        neighborhoodLabel
            .top(to: addressLabel.bottomAnchor, spacing: 4)
            .leading(to: containerView.leadingAnchor)
            .trailing(to: containerView.trailingAnchor)
    }
    
    func setupPhoneLabel() {
        containerView.addSubview(phoneLabel)
        phoneLabel.numberOfLines = 1
        phoneLabel.font = UIFont.systemFont(ofSize: 13)
        phoneLabel.textColor = .black
        phoneLabel
            .top(to: neighborhoodLabel.bottomAnchor, spacing: 4)
            .bottom(to: containerView.bottomAnchor)
            .leading(to: containerView.leadingAnchor)
            .trailing(to: containerView.trailingAnchor)
    }
    
}
