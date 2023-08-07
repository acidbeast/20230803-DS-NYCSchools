//
//  RouterTest.swift
//  20230803-DS-NYCSchoolsTests
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import XCTest
@testable import _0230803_DS_NYCSchools

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    var popedVC: UIViewController?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.presentedVC = viewControllerToPresent
        super.present(viewControllerToPresent, animated: flag)
    }
    override func popViewController(animated: Bool) -> UIViewController? {
        self.popedVC = viewControllers.last
        return nil
    }
}


final class RouterTest: XCTestCase {

    let navigationController = MockNavigationController()
    let moduleBuilder = ModuleBuilder()
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
    
    func testRouterStart() throws {
        router.start()
        XCTAssertTrue(navigationController.viewControllers[0] is SchoolsListVC)
    }

    func testRouterShowSchoolsList() throws {
        router.showSchoolsList()
        XCTAssertTrue(navigationController.viewControllers.last is SchoolsListVC)
    }
    
    func testRouterShowSchoolDetails() throws {
        router.showSchoolDetails(dbn: "")
        XCTAssertTrue(navigationController.presentedVC is SchoolDetailsVC)
    }
    
    func testRouterGoToRoot() {
        router.start()
        router.showSchoolDetails(dbn: "")
        router.goToRoot()
        XCTAssertEqual(navigationController.viewControllers.count, 1)
    }
    
    func testRouterGoBack() {
        router.showSchoolDetails(dbn: "")
        router.goBack()
        XCTAssertTrue(navigationController.popedVC is SchoolDetailsVC)
    }
    
}
