//
//  Router.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/4/23.
//

import UIKit


protocol RouterProtocol {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilderProtocol? { get set }
    func start()
    func goToRoot()
    func goBack()
}

protocol MainRouterProtocol: RouterProtocol {
    func goToSchoolsList()
}

final class MainRouter: MainRouterProtocol {
    
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilderProtocol?
    
    init(
        navigationController: UINavigationController? = nil,
        moduleBuilder: ModuleBuilderProtocol? = nil
    ) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func start() {
        goToSchoolsList()
    }
    
    func goToRoot() {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
    
    func goBack() {
        guard let navigationController = navigationController else { return }
        navigationController.popViewController(animated: true)
    }
    
    func goToSchoolsList() {
        guard let navigationController = navigationController else { return }
        guard let vc = moduleBuilder?.createSchoolsListModule(router: self) else { return }
        navigationController.viewControllers = [vc]
    }
    
    
}
