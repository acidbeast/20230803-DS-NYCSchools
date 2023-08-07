//
//  SchoolDetailsTitleCollectionViewCell.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import UIKit

final class SchoolDetailsTitleCollectionViewCell: UICollectionViewCell {
    
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

// MARK: - Setup
private extension SchoolDetailsTitleCollectionViewCell {
    
    func setup() {
        setupTextLabel()
    }
    
    func setupTextLabel() {
        addSubview(textLabel)
        textLabel.textColor = .black
        textLabel.font = UIFont.systemFont(ofSize: 24)
        textLabel.numberOfLines = 0
        textLabel.pin(to: self)
    }

}

extension SchoolDetailsTitleCollectionViewCell {
    
    func updateWith(title: String) {
        textLabel.text = title
    }
        
}

