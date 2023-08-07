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
    func getSchoolsSorted(by name: String) -> SchoolsList? { return nil }
    
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


final class SchoolsDetailsVMSatServiceMock: SatServiceProtocol {
    
    var callCounter = 0
    
    func getSatResults(dbn: String, completion: @escaping (SatResultList?, Error?) -> Void) {
        callCounter += 1
    }
    
}

final class SchoolsDetailsVMTests: XCTestCase {
        
    override func setUpWithError() throws {}
    
    override func tearDownWithError() throws {}
    
    func testSchoolsServiceCall() throws {
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
  
}
