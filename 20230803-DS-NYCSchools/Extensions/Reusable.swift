//
//  Reusable.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/6/23.
//

import UIKit

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        String(describing: Self.self)
    }
}

extension UITableViewCell: Reusable {}
extension UICollectionViewCell: Reusable {}
