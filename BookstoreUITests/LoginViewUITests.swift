//
//  LoginViewUITests.swift
//  BookstoreUITests
//
//  Created by Leonardo Simoza on 30/07/21.
//

import XCTest
import SwiftUI

class LoginViewUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testForElementsInLogin() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let lblNoteWolox = app.staticTexts.element
        XCTAssertTrue(lblNoteWolox.waitForExistence(timeout: 2))
        XCTAssertTrue(lblNoteWolox.exists)

        let btnLogin = app.buttons["btnLogin"]
        XCTAssertEqual(btnLogin.label, localizedString(Localizable.btnLogin.rawValue).uppercased())
        
        btnLogin.tap()
    }

}

