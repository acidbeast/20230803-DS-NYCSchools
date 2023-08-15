//
//  SchoolDetailsVM.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

protocol SchoolDetailsVMProtocol {
    var navigationTitle: String { get }
    var updateViewData: ((SchoolDetailsViewData) -> Void)? { get set }
    func getData()
}

final class SchoolDetailsVM: SchoolDetailsVMProtocol {
    
    let navigationTitle = "Details"
    public var updateViewData: ((SchoolDetailsViewData) -> Void)?
    
    private var dbn: String
    private var schoolsService: SchoolsServiceProtocol
    private var satService: SatServiceProtocol
    
    init(
        dbn: String,
        schoolsService: SchoolsServiceProtocol,
        satService: SatServiceProtocol
    ) {
        self.dbn = dbn
        self.schoolsService = schoolsService
        self.satService = satService
        updateViewData?(.initial)
    }
    
    func getData() {
        guard let school = getSchool() else {
            handleError()
            return
        }
        updateViewData?(.loading(.init(
            title: "Loading",
            description: "Please wait...",
            sections: nil
        )))
        satService.getSatResults(dbn: dbn) { [weak self] satResults, error in
            self?.handleData(school: school, satResults: satResults)
        }
    }
    
    private func handleError(title: String = "Network Error") {
        updateViewData?(.error(.init(
            title: title,
            description: "Please, try again later.",
            sections: nil
        )))
    }
    
    private func handleData(school: School, satResults: SatResultList?) {
        var sections: [SchoolDetailsSectionVM] = []
        sections += getMainSection(school: school)
        sections.append(.init(type: .separator))
        sections += getAdditionalInfo(school: school)
        sections.append(.init(type: .separator))
        if let satResult = satResults?.first {
            sections += getSatResults(school: school, satResult: satResult)
            sections.append(.init(type: .separator))
        }
        sections += getLocationInfo(school: school)
        if school.isAdmissionPriority() {
            sections.append(.init(type: .separator))
            sections += getAdmissionPriority(school: school)
        }
        if school.isRequirements() {
            sections.append(.init(type: .separator))
            sections += getRequirements(school: school)
        }
        self.updateViewData?(.success(.init(
            title: school.schoolName,
            description: school.overviewParagraph,
            sections: sections
        )))
    }
    
    private func getMainSection(school: School) -> [SchoolDetailsSectionVM] {
        var sections: [SchoolDetailsSectionVM] = []
        sections.append(.init(type: .title(text: school.schoolName)))
        sections.append(.init(type: .text(vm: .init(
            text: "\(school.primaryAddressLine1), \(school.city) \(school.stateCode) \(school.zip)",
            color: .darkGray
        ))))
        sections.append(.init(type: .text(vm: .init(
            label: "Neighborhood: ",
            text: "\(school.neighborhood)",
            lines: 1,
            topSpace: 0
        ))))
        sections.append(.init(type: .text(vm: .init(
            label: "Phone: ",
            text: "\(school.phoneNumber)",
            lines: 1,
            topSpace: 0
        ))))
        if
            let faxNumber = school.faxNumber,
            !faxNumber.isEmpty {
            sections.append(.init(type: .text(vm: .init(
                label: "Fax: ",
                text: "\(faxNumber)",
                lines: 1,
                topSpace: 0
            ))))
        }
        if let email = school.schoolEmail {
            sections.append(.init(type: .text(vm: .init(
                label: "Email: ",
                text: "\(email)",
                lines: 1,
                topSpace: 0
            ))))
        }
        if let website = school.website {
            sections.append(.init(type: .text(vm: .init(
                label: "Website: ",
                text: "\(website)",
                lines: 1,
                topSpace: 0,
                isLink: true
            ))))
        }
        sections.append(.init(type: .text(vm: .init(
            text: school.overviewParagraph
        ))))
        return sections
    }
    
    
    private func getAdditionalInfo(school: School) -> [SchoolDetailsSectionVM] {
        var sections: [SchoolDetailsSectionVM] = []
//        sections.append(.init(type: .text(
//            label: "Final Grades: ",
//            text: school.finalgrades ?? "N/A"
//        )))
//        sections.append(.init(type: .text(
//            label: "Total Students: ",
//            text: school.totalStudents ?? "N/A"
//        )))
//        sections.append(.init(type: .text(
//            label: "Attendance Rate: ",
//            text: school.getAttendanceRate()
//        )))
//        if let interest = school.interest1 {
//            sections.append(.init(type: .text(
//                label: "Interest: ",
//                text: "\(interest)"
//            )))
//        }
//        if let sports = school.schoolSports {
//            sections.append(.init(type: .text(
//                label: "Sports: ",
//                text: "\(sports)"
//            )))
//        }
//        if let extracurricularActivities = school.extracurricularActivities {
//            sections.append(.init(type: .text(
//                label: "Extra activities: ",
//                text: "\(extracurricularActivities)"
//            )))
//        }
        return sections
    }
    
    private func getSatResults(
        school: School,
        satResult: SatResult
    ) -> [SchoolDetailsSectionVM] {
        var sections: [SchoolDetailsSectionVM] = []
        sections.append(.init(type: .subtitle(text: "SAT Results")))
        sections.append(.init(type: .twoColumns(
            text: "Number of takers:",
            value: satResult.numOfSatTestTakers
        )))
        sections.append(.init(type: .twoColumns(
            text: "Critical Reading Avg. Score:",
            value: satResult.satCriticalReadingAvgScore,
            background: true
        )))
        sections.append(.init(type: .twoColumns(
            text: "Math Avg. Score:",
            value: satResult.satMathAvgScore
        )))
        sections.append(.init(type: .twoColumns(
            text: "Writing Avg. Score:",
            value: satResult.satWritingAvgScore,
            background: true
        )))
        return sections
    }
    
    private func getLocationInfo(school: School) -> [SchoolDetailsSectionVM] {
        var sections: [SchoolDetailsSectionVM] = []
        sections.append(.init(type: .subtitle(text: "How to get there")))
//        sections.append(.init(type: .text(
//            label: "Bus: ",
//            text: "\(school.bus)"
//        )))
//        sections.append(.init(type: .text(
//            label: "Subway: ",
//            text: "\(school.subway)"
//        )))
        return sections
    }
    
    private func getAdmissionPriority(school: School) -> [SchoolDetailsSectionVM] {
        var sections: [SchoolDetailsSectionVM] = []
        sections.append(.init(type: .subtitle(text: "Admission")))
//        if let admissionspriority11 = school.admissionspriority11 {
//            sections.append(.init(type: .text(
//                label: "- ",
//                text: "\(admissionspriority11)"
//            )))
//        }
//        if let admissionspriority21 = school.admissionspriority21 {
//            sections.append(.init(type: .text(
//                label: "- ",
//                text: "\(admissionspriority21)"
//            )))
//        }
//        if let admissionspriority31 = school.admissionspriority31 {
//            sections.append(.init(type: .text(
//                label: "- ",
//                text: "\(admissionspriority31)"
//            )))
//        }
        return sections
    }
    
    private func getRequirements(school: School) -> [SchoolDetailsSectionVM] {
        var sections: [SchoolDetailsSectionVM] = []
        sections.append(.init(type: .subtitle(text: "Requirements")))
//        if let requirement11 = school.requirement11 {
//            sections.append(.init(type: .text(
//                label: "- ",
//                text: "\(requirement11)"
//            )))
//        }
//        if let requirement21 = school.requirement21 {
//            sections.append(.init(type: .text(
//                label: "- ",
//                text: "\(requirement21)"
//            )))
//        }
//        if let requirement31 = school.requirement31 {
//            sections.append(.init(type: .text(
//                label: "- ",
//                text: "\(requirement31)"
//            )))
//        }
//        if let requirement41 = school.requirement41 {
//            sections.append(.init(type: .text(
//                label: "- ",
//                text: "\(requirement41)"
//            )))
//        }
//        if let requirement51 = school.requirement51 {
//            sections.append(.init(type: .text(
//                label: "- ",
//                text: "\(requirement51)"
//            )))
//        }
        return sections
    }
    
    private func getSchool() -> School? {
        schoolsService.getSchool(dbn: dbn)
    }
            
}
