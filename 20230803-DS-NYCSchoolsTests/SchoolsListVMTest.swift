//
//  SchoolsListVMTest.swift
//  20230803-DS-NYCSchoolsTests
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import XCTest
@testable import _0230803_DS_NYCSchools

final class PostListVMTests: XCTestCase {
        
    override func setUpWithError() throws {}
    
    override func tearDownWithError() throws {}
    
    func testGetPostsServiceCall() throws {
        let viewModel = SchoolsListVM()
        viewModel.getSchools()
        XCTAssert(viewModel.cellViewModels.count > 0)
    }
    
}
