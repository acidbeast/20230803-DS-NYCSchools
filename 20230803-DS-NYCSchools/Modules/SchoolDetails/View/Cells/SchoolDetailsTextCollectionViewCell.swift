//
//  SchoolDetailsTextCollectionViewCell.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import UIKit


final class SchoolDetailsTextCollectionViewCell: UICollectionViewCell {
    
    private let textLabel = UILabel()
    
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
    }
    
}

private extension SchoolDetailsTextCollectionViewCell {
    
    func setup() {
        setupTextLabel()
    }
    
    func setupTextLabel() {
        addSubview(textLabel)
        textLabel.text = ""
        textLabel.textColor = .black
        textLabel.font = UIFont(name: "Avenir Next Regular", size: 16)
        textLabel.textAlignment = .left
        textLabel.numberOfLines = 0
        textLabel
            .pin(to: self, withInsets: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
}


extension SchoolDetailsTextCollectionViewCell {
    
    func updateWith(values: (String, Int, UIColor)) {
        textLabel.text = values.0
        textLabel.numberOfLines = values.1
        textLabel.textColor = values.2
    }
    
}
