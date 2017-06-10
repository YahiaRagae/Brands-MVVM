//
//  BrandsUITests.swift
//  BrandsUITests
//
//  Created by Yahia on 6/10/17.
//  Copyright © 2017 Yahia. All rights reserved.
//

import XCTest
import BEMCheckBox
class BrandsUITests: XCTestCase {
    let app = XCUIApplication()
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
  
        
        XCUIApplication().tables.children(matching: .cell).element(boundBy: 1).otherElements["MyCheckBox"].tap()
        
        
      let stringOfCell0Section1 = app.tables.children(matching: .cell).element(boundBy: 2).staticTexts["MyLabel"].label
        
      let stringOfCell0Section0 = app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["MyLabel"].label
        
        
        XCTAssert( stringOfCell0Section1 == stringOfCell0Section0 , "There is aproblem with adding")
        
        print(app.debugDescription)
        
        
    }
    
}
