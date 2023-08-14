//
//  School.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import Foundation

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
    let latitude: String?
    let longitude: String?
    let faxNumber: String?
    let schoolEmail: String?
    let website: String?
    let subway: String
    let bus: String
    let totalStudents: String?
    let requirement11: String?
    let requirement21: String?
    let requirement31: String?
    let requirement41: String?
    let requirement51: String?
    let admissionspriority11: String?
    let admissionspriority21: String?
    let admissionspriority31: String?
    let finalgrades: String?
    let attendanceRate: String?
    let interest1: String?
    let schoolSports: String?
    let extracurricularActivities: String?
    
    
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
        case latitude
        case longitude
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case website
        case subway
        case bus
        case totalStudents = "total_students"
        case requirement11 = "requirement1_1"
        case requirement21 = "requirement2_1"
        case requirement31 = "requirement3_1"
        case requirement41 = "requirement4_1"
        case requirement51 = "requirement5_1"
        case admissionspriority11 = "admissionspriority11"
        case admissionspriority21 = "admissionspriority21"
        case admissionspriority31 = "admissionspriority31"
        case finalgrades
        case attendanceRate = "attendance_rate"
        case interest1
        case schoolSports = "school_sports"
        case extracurricularActivities = "extracurricular_activities"
    }
    
    func isAdmissionPriority() -> Bool {
        admissionspriority11 != nil || admissionspriority21 != nil || admissionspriority31 != nil
    }
    
    func isRequirements() -> Bool {
        requirement11 != nil || requirement21 != nil || requirement31 != nil || requirement41 != nil || requirement51 != nil
    }
    
    func getAttendanceRate() -> String {
        guard let attendanceRate = attendanceRate else { return  "N/A" }
        guard let convertedAttendanceRate = Double(attendanceRate) else { return "N/A" }
        let result = Int(round(100 * convertedAttendanceRate))
        return "\(String(result))%"
    }
    
}
