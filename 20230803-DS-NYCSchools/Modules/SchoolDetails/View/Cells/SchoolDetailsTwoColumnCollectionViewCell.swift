//
//  SchoolDetailsTwoColumnsCollectionViewCell.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import UIKit

final class SchoolDetailsTwoColumnsCollectionViewCell: UICollectionViewCell {
    
    private let textLabel = UILabel()
    private let valueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel.text = ""
        valueLabel.text = ""
    }
    
}

// MARK: - Setup
private extension SchoolDetailsTwoColumnsCollectionViewCell {
    
    func setup() {
        setupValueLabel()
        setupTextLabel()
    }
    
    func setupValueLabel() {
        addSubview(valueLabel)
        valueLabel.textColor = .black
        valueLabel.font = UIFont.systemFont(ofSize: 13)
        valueLabel.numberOfLines = 0
        valueLabel.textAlignment = .right
        valueLabel
            .width(50)
            .top(to: topAnchor, spacing: 8)
            .trailing(to: trailingAnchor, spacing: -4)
            .bottom(to: bottomAnchor, spacing: -8)
    }
        
    func setupTextLabel() {
        addSubview(textLabel)
        textLabel.textColor = .black
        textLabel.font = UIFont.systemFont(ofSize: 13)
        textLabel.numberOfLines = 0
        textLabel
            .top(to: topAnchor, spacing: 8)
            .bottom(to: bottomAnchor, spacing: -8)
            .leading(to: leadingAnchor, spacing: 4)
            .trailing(to: trailingAnchor, spacing: 50)
    }

}

extension SchoolDetailsTwoColumnsCollectionViewCell {
    
    func updateWith(values: (String, String, Bool)) {
        textLabel.text = values.0
        valueLabel.text = values.1
        if values.2 == true {
            backgroundColor = UIColor(hex: "#efefef")
        }
    }
        
}



