

//
//  RemoteUITests.swift
//  RemoteUITests
//
//  Created by Jonathan Velazquez on 25/12/15.
//  Copyright © 2015 Jonathan Velazquez. All rights reserved.
//

import XCTest

class RemoteUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        let peripheralButton = app.buttons["Peripheral"]
        peripheralButton.tap()
        
        let regresarButton = app.buttons["Regresar"]
        regresarButton.tap()
        app.buttons["Central"].tap()
        app.buttons["Ok"].tap()
        app.buttons["Cancelar"].tap()
        peripheralButton.tap()
        regresarButton.tap()
        
        
        
    }
    
}
