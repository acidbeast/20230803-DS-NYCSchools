//
//  ModuleBuilder.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/4/23.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createSchoolsListModule(router: MainRouterProtocol) -> UIViewController
}

final class ModuleBuilder: ModuleBuilderProtocol {

    func createSchoolsListModule(router: MainRouterProtocol) -> UIViewController {
        let schoolsService = SchoolsService()
        let vm = SchoolsListVM(schoolsService: schoolsService)
        let vc = SchoolsListVC(
            router: router,
            viewModel: vm
        )
        return vc
    }

}
