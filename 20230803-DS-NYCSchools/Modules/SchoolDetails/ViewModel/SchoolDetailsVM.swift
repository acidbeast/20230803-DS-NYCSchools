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
            if (error) != nil {
                self?.handleError()
                return
            }
            guard let satResults = satResults?.first else {
                self?.handleError(title: "Parse Error")
                return
            }
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
    
    private func handleData(school: School, satResults: SatResult) {
        let sections: [SchoolDetailsSectionVM] = [
            .init(type: .title(text: school.schoolName)),
            .init(type: .text(
                text: "\(school.primaryAddressLine1), \(school.city) \(school.stateCode) \(school.zip)",
                lines: 1,
                color: .darkGray
            )),
            .init(type: .text(
                text: "Neighborhood: \(school.neighborhood)",
                lines: 1,
                color: .black
            )),
            .init(type: .text(
                text: "Phone: \(school.phoneNumber)",
                lines: 1,
                color: .black
            )),
            .init(type: .text(text: school.overviewParagraph, lines: 0, color: .black)),
            .init(type: .subtitle(text: "SAT Results")),
            .init(type: .twoColumns(
                text: "Number of takers:",
                value: satResults.numOfSatTestTakers
            )),
            .init(type: .twoColumns(
                text: "Critical Reading Avg. Score:",
                value: satResults.satCriticalReadingAvgScore
            )),
            .init(type: .twoColumns(
                text: "Math Avg. Score:",
                value: satResults.satMathAvgScore
            )),
            .init(type: .twoColumns(
                text: "Writing Avg. Score:",
                value: satResults.satWritingAvgScore
            )),
            .init(type: .subtitle(text: "How to get")),
            .init(type: .text(text: "Bus: \(school.bus)", lines: 0, color: .black)),
            .init(type: .text(text: "Subway: \(school.subway)", lines: 0, color: .black)),
        ]
//        if
//            let latitude = school.latitude,
//            let longitude = school.longitude {
//            sections.insert(.init(type: .map(
//                latitude: latitude,
//                longitude: longitude)
//            ), at: 11)
//        }
        self.updateViewData?(.success(.init(
            title: school.schoolName,
            description: school.overviewParagraph,
            sections: sections
        )))
    }
    
    private func getSchool() -> School? {
        schoolsService.getSchool(dbn: dbn)
    }
            
}
