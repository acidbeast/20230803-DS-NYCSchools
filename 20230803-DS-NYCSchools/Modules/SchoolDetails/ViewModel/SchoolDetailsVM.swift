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
                satResult: nil
            )))
            return
        }
        updateViewData?(.loading(.init(
            title: "Loading",
            description: "Please wait...",
            satResult: nil
        )))
        satService.getSatResults(dbn: dbn) { [weak self] satResults, error in

            // Handle Error
            if (error) != nil {
                self?.updateViewData?(.error(.init(
                    title: "Network Error",
                    description: "Please, try again later.",
                    satResult: nil
                )))
                return
            }
            
            // Check Data
            guard let satResults = satResults else {
                self?.updateViewData?(.error(.init(
                    title: "Parse Error",
                    description: "Please, try again later.",
                    satResult: nil
                )))
                return
            }
            
            // Handle Data
            self?.updateViewData?(.success(.init(
                title: school.schoolName,
                description: school.overviewParagraph,
                satResult: satResults.first
            )))
            
        }
    }
    
    private func getSchool() -> School? {
        schoolsService.getSchool(dbn: dbn)
    }
            
}
