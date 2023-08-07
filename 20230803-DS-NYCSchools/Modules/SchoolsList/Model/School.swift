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
    let neighborhood: String
    let phoneNumber: String
    let primaryAddressLine1: String
    let city: String
    let zip: String
    let stateCode: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
        case primaryAddressLine1 = "primary_address_line_1"
        case neighborhood
        case phoneNumber = "phone_number"
        case city
        case zip
        case stateCode = "state_code"
    }
    
}
