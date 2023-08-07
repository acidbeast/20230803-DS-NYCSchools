//
//  SchoolDetailsSectionVM.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import UIKit

enum SchoolDetailsSectionVMType {
    case title(text: String)
    case text(text: String, lines: Int, color: UIColor)
    case subtitle(text: String)
    case twoColumns(text: String, value: String)
}

struct SchoolDetailsSectionVM {
    let type: SchoolDetailsSectionVMType
}
