//
//  ModuleBuilder.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/4/23.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createModule() -> UIViewController
}

final class ModuleBuilder: ModuleBuilderProtocol {
    
    func createModule() -> UIViewController {
        return UIViewController()
    }
    
}
