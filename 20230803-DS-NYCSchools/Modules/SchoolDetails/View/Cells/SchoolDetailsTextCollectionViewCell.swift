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
    var linkText: String?
    var linkLabel: String?
    var linkAction: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        removeRecognizers()
        textLabel.text = ""
        textLabel.isUserInteractionEnabled = false
        linkText = nil
        linkLabel = nil
    }
    
    private func removeRecognizers() {
        for recognizer in textLabel.gestureRecognizers ?? [] {
            textLabel.removeGestureRecognizer(recognizer)
        }
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
    
    func updateWith(vm: SchoolDetailsTextCellVM) {
        let text = getLabelAttributedString(with: vm.label)
        text.append(getTextAttributedString(with: vm.text, vm.isLink))
        textLabel.attributedText = text
        textLabel.numberOfLines = vm.lines
        setTopSpace(vm.topSpace)
        setTextColor(vm: vm)
        addClickHandler(vm: vm)
    }
    
    @objc private func tapHandler(_ recognizer: UITapGestureRecognizer) {
        guard let linkText = linkText else { return }
        guard let linkLabel = linkLabel else { return }
        let tapLocation = recognizer.location(in: textLabel)
        let tapIndex = textLabel.indexOfAttributedTextCharacterAtPoint(point: tapLocation)
        if tapIndex > linkLabel.count && tapIndex < linkText.count {
            if let linkAction = linkAction {
                linkAction(linkText)
            }
        }
    }
    
    private func setTopSpace(_ topSpace: Double) {
        topConstraint?.constant = 0
        if topSpace > 0 {
            topConstraint?.constant = topSpace
            setNeedsLayout()
        }
    }
    
    private func setTextColor(vm: SchoolDetailsTextCellVM) {
        if !vm.isLink {
            textLabel.textColor = vm.color
        }
    }
    
    private func addClickHandler(vm: SchoolDetailsTextCellVM) {
        if vm.isLink {
            linkText = vm.text
            linkLabel = vm.label
            textLabel.isUserInteractionEnabled = true
            let tapgesture = UITapGestureRecognizer(
                target: self,
                action: #selector(tapHandler(_ :))
            )
            tapgesture.numberOfTapsRequired = 1
            self.textLabel.addGestureRecognizer(tapgesture)
        }
    }
    
    private func getLabelAttributedString(with value: String) -> NSMutableAttributedString {
        var text = ""
        if !value.isEmpty {
            text = value
        }
        let attrs = [
            NSAttributedString.Key.font : UIFont(name: "Avenir Next Medium", size: 16)
        ]
        let output = NSMutableAttributedString(
            string: text,
            attributes: attrs as [NSAttributedString.Key : Any]
        )
        return output
    }
    
    private func getTextAttributedString(
        with value: String,
        _ isLink: Bool
    ) -> NSMutableAttributedString {
        let text = value
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "Â", with: "")
        let range = NSMakeRange(0, text.count)
        let output = NSMutableAttributedString(string: text)
        if isLink {
            output.addAttribute(
                .foregroundColor,
                value: UIColor.systemBlue,
                range: range
            )
            output.addAttribute(
                .underlineStyle,
                value: NSUnderlineStyle.single.rawValue,
                range: range
            )
        }
        return output
    }
    
}
