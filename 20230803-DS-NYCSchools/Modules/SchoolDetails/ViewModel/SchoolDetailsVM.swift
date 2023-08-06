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
    
    init(
        dbn: String,
        schoolsService: SchoolsServiceProtocol
    ) {
        self.dbn = dbn
        self.schoolsService = schoolsService
        updateViewData?(.initial)
    }
    
    func getData() {
        guard let school = getSchool() else { return }
        updateViewData?(.success(.init(
            title: school.schoolName,
            description: school.overviewParagraph
        )))
    }
    
    private func getSchool() -> School? {
        schoolsService.getSchool(dbn: dbn)
    }
        
}
