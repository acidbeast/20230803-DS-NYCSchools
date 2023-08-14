//
//  SchoolDetailsTextCollectionViewCell.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import UIKit

final class SchoolDetailsTextCollectionViewCell: UICollectionViewCell {
    
    private let textLabel = UILabel()
    private let prefixLabel = UILabel()
    var topConstraint : NSLayoutConstraint?
    
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
        textLabel.textColor = .black
        textLabel.font = UIFont(name: "Avenir Next Regular", size: 16)
        textLabel.textAlignment = .left
        textLabel.numberOfLines = 0
        textLabel
            .pinWithoutTop(to: self)
        topConstraint = textLabel.topAnchor.constraint(
            equalTo: self.topAnchor,
            constant: 0
        )
        topConstraint?.isActive = true
    }
    
}

extension SchoolDetailsTextCollectionViewCell {
    
    func updateWith(values: (String, String, Int, UIColor, Double)) {
        
        var prefixText = ""
        if !values.0.isEmpty {
            prefixText = "\(values.0)"
        }

        let attrs = [
            NSAttributedString.Key.font : UIFont(name: "Avenir Next Medium", size: 16)
        ]
        let prefixString = NSMutableAttributedString(
            string: prefixText,
            attributes: attrs as [NSAttributedString.Key : Any]
        )

        let textValue = values.1
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "Â", with: "")
        let text = "\(textValue)"
        let textString = NSMutableAttributedString(string: text)
        prefixString.append(textString)

        textLabel.attributedText = prefixString
        textLabel.numberOfLines = values.2
        textLabel.textColor = values.3
        topConstraint?.constant = 0
        if values.4 > 0 {
            topConstraint?.constant = values.4
            setNeedsLayout()
        }
        
    }
    
}
