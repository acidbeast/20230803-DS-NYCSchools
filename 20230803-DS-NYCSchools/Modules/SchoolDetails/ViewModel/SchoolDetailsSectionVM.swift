//
//  SchoolDetailsSectionVM.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import UIKit

enum SchoolDetailsSectionVMType {
    case title(text: String)
    case text(
        label: String = "",
        text: String,
        lines: Int = 0,
        color: UIColor = .black,
        topSpace: Double = 16
    )
    case subtitle(text: String)
    case twoColumns(
        text: String,
        value: String,
        background: Bool = false
    )
    case separator
}

struct SchoolDetailsSectionVM {
    let type: SchoolDetailsSectionVMType
}
