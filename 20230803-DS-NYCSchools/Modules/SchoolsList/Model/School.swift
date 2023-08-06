//
//  School.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

typealias SchoolsList = [School]

struct School: Codable {
    
    let schoolName: String
    
    enum CodingKeys: String, CodingKey {
        case schoolName = "school_name"
    }
    
}
