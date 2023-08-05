//
//  SchoolsListViewData.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

enum SchoolsListViewData {
    
    case initial
    case loading(Data)
    case empty(Data)
    case success(Data)
    case error(Data)
    
    struct Data {
        let title: String
        let description: String
        let schools: [SchoolsListCellVM]?
    }
    
}
