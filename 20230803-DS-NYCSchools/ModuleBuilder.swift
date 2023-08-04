//
//  ModuleBuilder.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/4/23.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createModule(router: MainRouterProtocol) -> UIViewController
}

final class ModuleBuilder: ModuleBuilderProtocol {
    
    func createModule(router: MainRouterProtocol) -> UIViewController {
        return ViewController()
    }
    
}
