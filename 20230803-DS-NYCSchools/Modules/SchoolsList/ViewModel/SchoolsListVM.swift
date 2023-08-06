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
    
    private var schoolsService: SchoolsServiceProtocol
    
    var navigationTitle = "NYC Schools"
    var updateViewData: ((SchoolsListViewData) -> Void)?
    var cellViewModels: [SchoolsListCellVM] = []
    
    init(schoolsService: SchoolsServiceProtocol) {
        self.schoolsService = schoolsService
        updateViewData?(.initial)
    }
    
    func getSchools() {
        self.updateViewData?(.loading(.init(
            title: "Loading",
            description: "Please wait...",
            schools: nil
        )))
        schoolsService.getSchools { [weak self] schools, error in
            
            // Handle Error
            if (error) != nil {
                self?.updateViewData?(.error(.init(
                    title: "Network Error",
                    description: "Please, try again later.",
                    schools: nil
                )))
                return
            }
            
            // Check Data
            guard let schools = schools else {
                self?.updateViewData?(.error(.init(
                    title: "Parse Error",
                    description: "Please, try again later.",
                    schools: nil
                )))
                return
            }
            
            // Check Data count
            if schools.count == 0 {
                self?.updateViewData?(.empty(.init(
                    title: "Empty",
                    description: "Post list is empty.",
                    schools: self?.cellViewModels
                )))
            }

            // Handle Data
            self?.createCellsViewModels(schools: schools)
            self?.cellViewModels.sort { $0.title < $1.title }
            self?.updateViewData?(.success(.init(
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
