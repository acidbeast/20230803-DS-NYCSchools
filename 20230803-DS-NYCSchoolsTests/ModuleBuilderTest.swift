//
//  ModuleBuilderTest.swift
//  20230803-DS-NYCSchoolsTests
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import XCTest
@testable import _0230803_DS_NYCSchools

final class ModuleBuilderTest: XCTestCase {

    let moduleBuilder = ModuleBuilder()
    let navigationController = UINavigationController()
    var router: MainRouterProtocol!
    
    override func setUp() {
        router = MainRouter(
            navigationController: navigationController,
            moduleBuilder: moduleBuilder
        )
    }

    override func tearDown() {
        router = nil
    }

    func testCreateSchoolsListModule() throws {
        let vc = moduleBuilder.createSchoolsListModule(router: router)
        XCTAssertTrue(vc is SchoolsListVC)
        XCTAssertTrue((vc as? SchoolsListVC)?.viewModel is SchoolsListVM)
    }
    

    func testCreateSchoolDetailsModule() throws {
        let vc = moduleBuilder.createSchoolDetailsModule(router: router, dbn: "")
        XCTAssertTrue(vc is SchoolDetailsVC)
        XCTAssertTrue((vc as? SchoolDetailsVC)?.viewModel is SchoolDetailsVM)
    }

}
