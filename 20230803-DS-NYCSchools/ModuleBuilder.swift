//
//  ModuleBuilder.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/4/23.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createSchoolsListModule(router: MainRouterProtocol) -> UIViewController
    func createSchoolDetailsModule(router: MainRouterProtocol, dbn: String) -> UIViewController
}

final class ModuleBuilder: ModuleBuilderProtocol {

    private let schoolsService = SchoolsService()
    private let satService = SatService()
    
    func createSchoolsListModule(router: MainRouterProtocol) -> UIViewController {
        let vm = SchoolsListVM(schoolsService: schoolsService)
        let vc = SchoolsListVC(
            router: router,
            viewModel: vm
        )
        return vc
    }
    
    func createSchoolDetailsModule(
        router: MainRouterProtocol,
        dbn: String
    ) -> UIViewController {
        let vm = SchoolDetailsVM(
            dbn: dbn,
            schoolsService: schoolsService,
            satService: satService
        )
        let vc = SchoolDetailsVC(
            router: router,
            viewModel: vm
        )
        return vc
    }

}
