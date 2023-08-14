//
//  SchoolDetailsSeparatorCollectionViewCell.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/11/23.
//

import UIKit

final class SchoolDetailsSeparatorCollectionViewCell: UICollectionViewCell {
    
    private let lineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Setup
private extension SchoolDetailsSeparatorCollectionViewCell {
    
    func setup() {
        setupHeight()
        setupTextLabel()
    }
    
    func setupHeight() {
        let heightAnchor = heightAnchor.constraint(equalToConstant: 16)
        heightAnchor.priority = UILayoutPriority(rawValue: 999)
        NSLayoutConstraint.activate([
            heightAnchor
        ])
    }
    
    func setupTextLabel() {
        addSubview(lineView)
        lineView.backgroundColor = .lightGray
        lineView.layer.masksToBounds = true
        lineView
            .height(1)
            .pinWithoutBottom(
                to: self,
                withInsets: .init(top: 16, left: 0, bottom: 0, right: 0)
            )
    }

}
