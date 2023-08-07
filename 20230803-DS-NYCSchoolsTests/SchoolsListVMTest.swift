//
//  SchoolsListVMTest.swift
//  20230803-DS-NYCSchoolsTests
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import XCTest
@testable import _0230803_DS_NYCSchools


final class SchoolsListServiceMock: SchoolsServiceProtocol {
    
    var callCounter = 0
    var schoolsList: SchoolsList?
    func getSchool(dbn: String) -> School? { return nil }
    
    func getSchools(completion: @escaping (SchoolsList?, Error?) -> Void) {
        callCounter += 1
    }

}

final class SchoolsListServiceErrorMock: SchoolsServiceProtocol {
    
    var schoolsList: SchoolsList?
    func getSchool(dbn: String) -> School? { return nil }
    
    
    func getSchools(completion: @escaping (SchoolsList?, Error?) -> Void) {
        enum TestError: Error {
            case error
        }
        let error: TestError = .error
        completion(nil, error)
    }
    
}

final class SchoolsListServiceParseErrorMock: SchoolsServiceProtocol {
    
    var schoolsList: SchoolsList?
    func getSchool(dbn: String) -> School? { return nil }
    
    func getSchools(completion: @escaping (SchoolsList?, Error?) -> Void) {
        completion(nil, nil)
    }
    
}

final class SchoolsListServiceEmptyMock: SchoolsServiceProtocol {
    
    var schoolsList: SchoolsList?
    func getSchool(dbn: String) -> School? { return nil }
    
    func getSchools(completion: @escaping (SchoolsList?, Error?) -> Void) {
        let data = SchoolsList()
        completion(data, nil)
    }
    
}

final class SchoolsListServiceSuccessMock: SchoolsServiceProtocol {

    var schoolsList: SchoolsList?
    func getSchool(dbn: String) -> School? { return nil }
    
    func getSchools(completion: @escaping (SchoolsList?, Error?) -> Void) {
        var data = SchoolsList()
        let item = School(dbn: "", schoolName: "", overviewParagraph: "")
        data.append(item)
        completion(data, nil)
    }

}

final class SchoolsListVMTests: XCTestCase {
    
    var schoolsViewDataMock: SchoolsListViewData.Data!
        
    override func setUpWithError() throws {
        schoolsViewDataMock = SchoolsListViewData.Data(
            title: "",
            description: "",
            schools: nil
        )
    }
    
    override func tearDownWithError() throws {
        schoolsViewDataMock = nil
    }
    
    func testCellViewModelsCreation() throws {
        let schoolsServiceMock = SchoolsListServiceSuccessMock()
        let viewModel = SchoolsListVM(schoolsService: schoolsServiceMock)
        viewModel.getSchools()
        XCTAssert(viewModel.cellViewModels.count > 0)
    }
    
    func testGetSchoolsServiceCall() throws {
        let schoolsServiceMock = SchoolsListServiceMock()
        let viewModel = SchoolsListVM(schoolsService: schoolsServiceMock)
        viewModel.getSchools()
        XCTAssert(schoolsServiceMock.callCounter == 1)
    }
    
    func testLoadingState() throws {
        let schoolsServiceMock = SchoolsListServiceMock()
        let viewModel = SchoolsListVM(schoolsService: schoolsServiceMock)
        viewModel.updateViewData = { viewData in
            XCTAssert(viewData == .loading(self.schoolsViewDataMock))
        }
        viewModel.getSchools()
    }
    
    func testErrorState() throws {
        let schoolsServiceMock = SchoolsListServiceErrorMock()
        let viewModel = SchoolsListVM(schoolsService: schoolsServiceMock)
        var updateViewDataCounter = 0
        viewModel.updateViewData = { viewData in
            updateViewDataCounter += 1
            if updateViewDataCounter == 1 {
                XCTAssert(viewData == .loading(self.schoolsViewDataMock))
            }
            if updateViewDataCounter == 2 {
                XCTAssert(viewData == .error(self.schoolsViewDataMock))
            }
        }
        viewModel.getSchools()
    }
    
    func testParseErrorState() throws {
        let schoolsServiceMock = SchoolsListServiceParseErrorMock()
        let viewModel = SchoolsListVM(schoolsService: schoolsServiceMock)
        var updateViewDataCounter = 0
        viewModel.updateViewData = { viewData in
            updateViewDataCounter += 1
            if updateViewDataCounter == 1 {
                XCTAssert(viewData == .loading(self.schoolsViewDataMock))
            }
            if updateViewDataCounter == 2 {
                XCTAssert(viewData == .error(self.schoolsViewDataMock))
            }
        }
        viewModel.getSchools()
    }
    
    func testEmptyState() throws {
        let schoolsServiceMock = SchoolsListServiceEmptyMock()
        let viewModel = SchoolsListVM(schoolsService: schoolsServiceMock)
        var updateViewDataCounter = 0
        viewModel.updateViewData = { viewData in
            updateViewDataCounter += 1
            if updateViewDataCounter == 1 {
                XCTAssert(viewData == .loading(self.schoolsViewDataMock))
            }
            if updateViewDataCounter == 2 {
                XCTAssert(viewData == .empty(self.schoolsViewDataMock))
            }
        }
        viewModel.getSchools()
    }
        
    func testSuccessState() throws {
        let schoolsServiceMock = SchoolsListServiceSuccessMock()
        let viewModel = SchoolsListVM(schoolsService: schoolsServiceMock)
        var updateViewDataCounter = 0
        viewModel.updateViewData = { viewData in
            updateViewDataCounter += 1
            if updateViewDataCounter == 1 {
                XCTAssert(viewData == .loading(self.schoolsViewDataMock))
            }
            if updateViewDataCounter == 2 {
                XCTAssert(viewData == .success(self.schoolsViewDataMock))
                XCTAssert(viewModel.cellViewModels.count == 1)
            }
        }
        viewModel.getSchools()
    }
    
}
