//
//  SchoolsListViewData.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

enum SchoolsListViewData: Equatable {
    
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
    
    static func == (lhs: SchoolsListViewData, rhs: SchoolsListViewData) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
        case (.loading, .loading):
            return true
        case (.empty, .empty):
            return true
        case (.success, .success):
            return true
        case ( .error, .error):
            return true
        default:
            return false
        }
    }
    
}
