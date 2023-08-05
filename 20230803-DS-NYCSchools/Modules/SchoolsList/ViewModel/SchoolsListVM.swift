//
//  SchoolsListVM.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import Foundation

protocol SchoolsListVMProtocol {
    var navigationTitle: String { get }
    var updateViewData: ((SchoolsListViewData) -> Void)? { get set }
    var cellViewModels: [SchoolsListCellVM] { get set }
    func getSchools()
}

final class SchoolsListVM: SchoolsListVMProtocol {
    
    var navigationTitle = "NYC Schools"
    var updateViewData: ((SchoolsListViewData) -> Void)?
    var cellViewModels: [SchoolsListCellVM] = []
    
    func getSchools() {
        self.updateViewData?(.loading(SchoolsListViewData.Data(
            title: "Loading",
            description: "Please wait...",
            schools: nil
        )))
        createCellsViewModels(schools: [
            School(schoolName: "School 1"),
            School(schoolName: "School 2"),
            School(schoolName: "School 3"),
            School(schoolName: "School 4"),
            School(schoolName: "School 5"),
            School(schoolName: "School 6"),
            School(schoolName: "School 7"),
            School(schoolName: "School 8"),
            School(schoolName: "School 9"),
            School(schoolName: "School 10"),
            School(schoolName: "School 11"),
            School(schoolName: "School 12"),
            School(schoolName: "School 13"),
            School(schoolName: "School 14"),
            School(schoolName: "School 15"),
            School(schoolName: "School 16"),
            School(schoolName: "School 17"),
            School(schoolName: "School 18"),
            School(schoolName: "School 19"),
            School(schoolName: "School 20"),
        ])
        // Delay to emulate network call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.updateViewData?(.success(SchoolsListViewData.Data(
                title: "",
                description: "",
                schools: self?.cellViewModels
            )))
        }
    }
    
    private func createCellsViewModels(schools: SchoolsList) {
        cellViewModels = []
        for school in schools {
            cellViewModels.append(createCellViewModelFrom(school: school))
        }
    }
    
    private func createCellViewModelFrom(school: School) -> SchoolsListCellVM {
        let title = school.schoolName
        return SchoolsListCellVM(title: title)
    }
    
}
