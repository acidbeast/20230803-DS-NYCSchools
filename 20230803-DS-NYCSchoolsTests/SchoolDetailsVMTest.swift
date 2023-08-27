//
//  SchoolDetailsVMTest.swift
//  20230803-DS-NYCSchoolsTests
//
//  Created by Dmitry Shlepkin on 8/6/23.
//

import XCTest
@testable import _0230803_DS_NYCSchools


final class SchoolsDetailsVMSchoolsServiceMock: SchoolsServiceProtocol {
    

    var callCounter = 0
    var schoolsList: SchoolsList?
    func getSchools(completion: @escaping (SchoolsList?, Error?) -> Void) {}
    func getSchoolsFiltered(by name: String) -> SchoolsList? { return nil }
    
    func getSchool(dbn: String) -> School? {
        callCounter += 1
        return School(
            dbn: "",
            schoolName: "",
            overviewParagraph: "",
            neighborhood: "",
            phoneNumber: "",
            primaryAddressLine1: "",
            city: "",
            zip: "",
            stateCode: ""
        )
    }

}

final class SchoolsDetailsVMSatsServiceErrorMock: SatServiceProtocol {
    func getSatResults(dbn: String, completion: @escaping (SatResultList?, Error?) -> Void) {
        enum TestError: Error {
            case error
        }
        let error: TestError = .error
        completion(nil, error)
    }
}

final class SchoolsDetailsVMSatsServiceSuccessMock: SatServiceProtocol {
    func getSatResults(dbn: String, completion: @escaping (SatResultList?, Error?) -> Void) {
        completion(.init([
            .init(
                dbn: "",
                schoolName: "",
                numOfSatTestTakers: "",
                satCriticalReadingAvgScore: "",
                satMathAvgScore: "",
                satWritingAvgScore: ""
            )
        ]), nil)
    }
}

final class SchoolsDetailsVMSatServiceMock: SatServiceProtocol {
    
    var callCounter = 0
    
    func getSatResults(dbn: String, completion: @escaping (SatResultList?, Error?) -> Void) {
        callCounter += 1
    }
    
}

final class SchoolsDetailsVMTests: XCTestCase {
        
    var schoolsViewDataMock: SchoolDetailsViewData.Data!
        
    override func setUpWithError() throws {
        schoolsViewDataMock = SchoolDetailsViewData.Data(
            title: "",
            description: "",
            sections: nil
        )
    }
    
    override func tearDownWithError() throws {
        schoolsViewDataMock = nil
    }
    
    func testServiceCalls() throws {
        let schoolsServiceMock = SchoolsDetailsVMSchoolsServiceMock()
        let satServiceMock = SchoolsDetailsVMSatServiceMock()
        let viewModel = SchoolDetailsVM(
            dbn: "",
            schoolsService: schoolsServiceMock,
            satService: satServiceMock
        )
        viewModel.getData()
        XCTAssert(schoolsServiceMock.callCounter == 1)
        XCTAssert(satServiceMock.callCounter == 1)
    }
    
    func testLoadingState() throws {
        let schoolsServiceMock = SchoolsDetailsVMSchoolsServiceMock()
        let satServiceMock = SchoolsDetailsVMSatServiceMock()
        let viewModel = SchoolDetailsVM(
            dbn: "",
            schoolsService: schoolsServiceMock,
            satService: satServiceMock
        )
        viewModel.updateViewData = { viewData in
            XCTAssert(viewData == .loading(self.schoolsViewDataMock))
        }
        viewModel.getData()
    }
    
    func testErrorState() throws {
        let schoolsServiceMock = SchoolsDetailsVMSchoolsServiceMock()
        let satServiceMock = SchoolsDetailsVMSatsServiceErrorMock()
        let viewModel = SchoolDetailsVM(
            dbn: "",
            schoolsService: schoolsServiceMock,
            satService: satServiceMock
        )
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
        viewModel.getData()
    }
    
    func testSuccessState() throws {
        let schoolsServiceMock = SchoolsDetailsVMSchoolsServiceMock()
        let satServiceMock = SchoolsDetailsVMSatsServiceSuccessMock()
        let viewModel = SchoolDetailsVM(
            dbn: "",
            schoolsService: schoolsServiceMock,
            satService: satServiceMock
        )
        var updateViewDataCounter = 0
        viewModel.updateViewData = { viewData in
            updateViewDataCounter += 1
            if updateViewDataCounter == 1 {
                XCTAssert(viewData == .loading(self.schoolsViewDataMock))
            }
            if updateViewDataCounter == 2 {
                XCTAssert(viewData == .success(self.schoolsViewDataMock))
            }
        }
        viewModel.getData()
    }
  
}
