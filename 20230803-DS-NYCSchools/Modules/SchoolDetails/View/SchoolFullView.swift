//
//  SchoolFullView.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//


import UIKit

final class SchoolFullView: UIView {
    
    private let titleLabel = UILabel()
    private let textLabel = UILabel()
    private let satTitleLabel = UILabel()
    private let satMathAvgLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup

extension SchoolFullView {
    
    func setup() {
        setupTitleLabel()
        setupTextLabel()
        setupSatTitleLabel()
        setupSatMathAvgLabel()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = ""
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.pinWithoutBottom(to: self, withInsets: .init(top: 16, left: 16, bottom: 0, right: -16))
    }
    
    private func setupTextLabel() {
        addSubview(textLabel)
        textLabel.text = ""
        textLabel.textColor = .black
        textLabel.font = UIFont(name: "Avenir Next Regular", size: 16)
        textLabel.textAlignment = .left
        textLabel.numberOfLines = 0
        textLabel
            .top(to: titleLabel.bottomAnchor, spacing: 16)
            .leading(to: self.leadingAnchor, spacing: 16)
            .trailing(to: self.trailingAnchor, spacing: -16)
    }
    
    private func setupSatTitleLabel() {
        addSubview(satTitleLabel)
        satTitleLabel.text = "SAT Score"
        satTitleLabel.textColor = .black
        satTitleLabel.font = UIFont.systemFont(ofSize: 20)
        satTitleLabel.textAlignment = .left
        satTitleLabel
            .top(to: textLabel.bottomAnchor, spacing: 16)
            .leading(to: self.leadingAnchor, spacing: 16)
            .trailing(to: self.trailingAnchor, spacing: 16)
    }
    
    private func setupSatMathAvgLabel() {
        addSubview(satMathAvgLabel)
        satMathAvgLabel.text = "SAT Score"
        satMathAvgLabel.textColor = .black
        satMathAvgLabel.font = UIFont(name: "Avenir Next Regular", size: 16)
        satMathAvgLabel.textAlignment = .left
        satMathAvgLabel
            .top(to: satTitleLabel.bottomAnchor, spacing: 16)
            .leading(to: self.leadingAnchor, spacing: 16)
            .trailing(to: self.trailingAnchor, spacing: 16)
    }
    
}

extension SchoolFullView {
    
    func updateWith(
        title: String,
        text: String,
        satMathAvg: String
    ) {
        titleLabel.text = title
        textLabel.text = text
        satMathAvgLabel.text = "Math Average Score: \(satMathAvg)"
    }
    
}
