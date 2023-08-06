//
//  School.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

typealias SchoolsList = [School]

struct School: Codable {
    
    let dbn: String
    let schoolName: String
    let overviewParagraph: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
    }
    
}
