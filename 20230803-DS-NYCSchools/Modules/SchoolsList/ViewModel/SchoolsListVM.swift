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
    func getSchoolsSorted(by name: String) 
}

final class SchoolsListVM: SchoolsListVMProtocol {
    
    private var schoolsService: SchoolsServiceProtocol
    
    let navigationTitle = "NYC Schools"
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
                    description: "Schools list is empty.",
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
    
    func getSchoolsSorted(by name: String) {
        self.updateViewData?(.loading(.init(
            title: "Loading",
            description: "Please wait...",
            schools: nil
        )))
        guard let schools = schoolsService.getSchoolsFiltered(by: name) else { return }
        if schools.count == 0 {
            self.updateViewData?(.empty(.init(
                title: "Not Found",
                description: "There is no school with this name.",
                schools: self.cellViewModels
            )))
        } else {
            self.createCellsViewModels(schools: schools)
            self.cellViewModels.sort { $0.title < $1.title }
            self.updateViewData?(.success(.init(
                title: "",
                description: "",
                schools: self.cellViewModels
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
        let dbn = school.dbn
        let title = school.schoolName
        let address = "\(school.primaryAddressLine1), \(school.city) \(school.stateCode) \(school.zip)"
        let neighborhood = "Neighborhood: \(school.neighborhood)"
        let phoneNumber = "Phone: \(school.phoneNumber)"
        return SchoolsListCellVM(
            dbn: dbn,
            title: title,
            address: address,
            neighborhood: neighborhood,
            phoneNumber: phoneNumber
        )
    }
    
}
