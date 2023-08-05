//
//  EmptyView.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import UIKit

final class EmptyView: UIView {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup
extension EmptyView {
    
    func setup() {
        setupImageView()
        setupTitleLabel()
        setupDescription()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.image = UIImage(systemName: "doc")
        imageView.tintColor = .lightGray
        imageView
            .width(90)
            .height(105)
            .centerX(to: self)
            .centerY(to: self, spacing: -80)
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Avenir Next Regular", size: 18.0)
        titleLabel.textColor = .darkGray
        titleLabel
            .centerX(to: self)
            .top(to: imageView.bottomAnchor, spacing: 16)
    }
    
    private func setupDescription() {
        addSubview(descriptionLabel)
        descriptionLabel.font = UIFont(name: "Avenir Next Regular", size: 14.0)
        descriptionLabel.textColor = .darkGray
        descriptionLabel
            .centerX(to: self)
            .top(to: titleLabel.bottomAnchor, spacing: 16)
    }
    
}


extension EmptyView {
    func updateWith(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}

