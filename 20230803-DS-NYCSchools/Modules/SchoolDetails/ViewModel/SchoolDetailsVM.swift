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
            updateViewData?(.error(.init(
                title: "Network Error",
                description: "Please, try again later.",
                sections: nil
            )))
            return
        }
        updateViewData?(.loading(.init(
            title: "Loading",
            description: "Please wait...",
            sections: nil
        )))
        satService.getSatResults(dbn: dbn) { [weak self] satResults, error in

            // Handle Error
            if (error) != nil {
                self?.updateViewData?(.error(.init(
                    title: "Network Error",
                    description: "Please, try again later.",
                    sections: nil
                )))
                return
            }
            
            // Check Data
            guard let satResults = satResults?.first else {
                self?.updateViewData?(.error(.init(
                    title: "Parse Error",
                    description: "Please, try again later.",
                    sections: nil
                )))
                return
            }
            
            // Handle Data
            self?.updateViewData?(.success(.init(
                title: school.schoolName,
                description: school.overviewParagraph,
                sections: [
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
                    ))
                ]
            )))
            
        }
    }
    
    private func getSchool() -> School? {
        schoolsService.getSchool(dbn: dbn)
    }
            
}
