//
//  SchoolDetailsViewData.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

enum SchoolDetailsViewData: Equatable {
    
    case initial
    case loading(Data)
    case error(Data)
    case success(Data)
    
    struct Data {
        let title: String
        let description: String
    }
    
    static func == (lhs: SchoolDetailsViewData, rhs: SchoolDetailsViewData) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
        case (.loading, .loading):
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
