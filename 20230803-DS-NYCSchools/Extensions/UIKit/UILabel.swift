//
//  UILabel.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/14/23.
//

import UIKit

extension UILabel {
   func indexOfAttributedTextCharacterAtPoint(point: CGPoint) -> Int {
       assert(self.attributedText != nil, "This method is developed for attributed string")
       let textStorage = NSTextStorage(attributedString: self.attributedText!)
       let layoutManager = NSLayoutManager()
       textStorage.addLayoutManager(layoutManager)
       let textContainer = NSTextContainer(size: self.frame.size)
       textContainer.lineFragmentPadding = 0
       textContainer.maximumNumberOfLines = self.numberOfLines
       textContainer.lineBreakMode = self.lineBreakMode
       layoutManager.addTextContainer(textContainer)
       let index = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
       return index
   }
}
