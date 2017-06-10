//
//  DataSourceTest.swift
//  Brands
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import XCTest

@testable import Brands

class DataSourceTest: XCTestCase {
    
    
    func testLocalDataSourceCount() {
        DataAccessController.sharedInstance.setNewDataSource(source: .Online)
        let exepetion:XCTestExpectation = self.expectation(description: "waitTillLocalDone")
        DataAccessController.sharedInstance.getBrands { (brands, errorMessage) in
            XCTAssert(brands.count == 8 , "Count is wrong")
            exepetion.fulfill()
        }
        
        self.wait(for: [exepetion], timeout: 5)
    }

    
    func testOnlineDataSourceCount() {
        DataAccessController.sharedInstance.setNewDataSource(source: .Online)
        let exepetion:XCTestExpectation = self.expectation(description: "waitTillConnectionDone")
        DataAccessController.sharedInstance.getBrands { (brands, errorMessage) in
            XCTAssert(brands.count == 8 , "Count is wrong")
            exepetion.fulfill()
        }
        
        self.wait(for: [exepetion], timeout: 5)
    }
    
    func testLocalFilePathExsit() {  
        XCTAssertNotNil(LocalController().getJsonPath())
    }
    
}
