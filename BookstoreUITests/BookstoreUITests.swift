//
//  BookstoreUITests.swift
//  BookstoreUITests
//
//  Created by Leonardo Simoza on 17/07/21.
//

import XCTest
import SwiftUI

@testable import Bookstore

enum Localizable: String {
    case
        btnLogin = "btn-signIn",
        btnAddWishlist = "btn-add-wishlist",
        btnRent = "btn-rent",
        btnViewAll = "btn-viewAll",
        navTitleLibrary = "nav-title-library",
        navTitleBookDetail = "nav-title-bookDetail",
        navTitleWishlist = "nav-title-wishlist",
        navTitleSuggest = "nav-title-suggest",
        navTitleRentals = "nav-title-rentals",
        tabBarTitleLibrary = "tabBar-title-library",
        tabBarTitleWishlist = "tabBar-title-wishlist",
        tabBarTitleSuggest = "tabBar-title-suggest",
        tabBarTitleRentals = "tabBar-title-rentals",
        lblNoteWolox = "lbl-note-wolox",
        lblSearch = "lbl-search",
        lblSearchBooks = "lbl-search-books"
}

class BookstoreUITests: XCTestCase {
    
    
    let app = XCUIApplication()
    let utcISODateFormatter = ISO8601DateFormatter()
    
    override func setUp() {
        super.setUp()
        app.launch()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }
    
    func testBTappingLoginButton() throws {
        try app.login(onTap: false)
        let btnLogin = app.buttons["btnLogin"]
        try appScreenshot()
        btnLogin.tap()
    }
    
    func testCValidateAppNavigation() throws {
        try app.login()
        // Set navigation by tab view
        let tabBar1 = app.tabBars.buttons.element(boundBy: 0)
        let tabBar2 = app.tabBars.buttons.element(boundBy: 1)
        let tabBar3 = app.tabBars.buttons.element(boundBy: 2)
        let tabBar4 = app.tabBars.buttons.element(boundBy: 3)
        XCTAssertEqual(tabBar1.label, localizedString(Localizable.tabBarTitleLibrary.rawValue))
        XCTAssertEqual(tabBar2.label, localizedString(Localizable.tabBarTitleWishlist.rawValue))
        XCTAssertEqual(tabBar3.label, localizedString(Localizable.tabBarTitleSuggest.rawValue))
        XCTAssertEqual(tabBar4.label, localizedString(Localizable.tabBarTitleRentals.rawValue))
        
        XCTAssertTrue(tabBar1.waitForExistence(timeout: 3))
        // Navigate all tabs
        try appScreenshot()
        tabBar1.press(forDuration: 0.5, thenDragTo: tabBar2)
        try appScreenshot()
        tabBar2.press(forDuration: 0.5, thenDragTo: tabBar3)
        try appScreenshot()
        tabBar3.press(forDuration: 0.5, thenDragTo: tabBar4)
        try appScreenshot()
        tabBar4.press(forDuration: 0.5, thenDragTo: tabBar1)
        
    }
    
    func testDTappingButtonToDisplaySearchField() throws {
        try app.login()
        // Activate textfield search
        let btnIconSearch = app.buttons["btnIconSearch"]
        XCTAssertTrue(btnIconSearch.waitForExistence(timeout: 1.5))
        btnIconSearch.tap()
        
        // Validate textfield
        let tfSearch = app.textFields["tfSearch"]
        XCTAssertTrue(tfSearch.waitForExistence(timeout: 2))
        tfSearch.tap()
        tfSearch.typeText("Test")
        // Validate textfield
        app.buttons["btnCleanSearch"].tap()
        try appScreenshot()
    }
    
    func testEPressCellToDetailView() throws {
        try app.login()
        XCTAssertTrue(app.tabBars.buttons.element(boundBy: 3).waitForExistence(timeout: 1.5))
        
        
    }
    
    func testFPressCellToDetailView() throws {
        try app.login()
        XCTAssertTrue(app.tabBars.buttons.element(boundBy: 3).waitForExistence(timeout: 1.5))
        // Printing a Date
        try appScreenshot()
    }
    
    func testALaunchPerformance() throws {
        if #available(iOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    // Take screenshot of the tests
    private func appScreenshot() throws {
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = utcISODateFormatter.string(from: Date())
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

extension XCUIApplication {
    func login(onTap: Bool = true) throws {
        let lblNoteWolox = staticTexts["lblNoteWolox"]
        // Validate that the object exists in the expected time
        XCTAssertTrue(lblNoteWolox.waitForExistence(timeout: 2))
        XCTAssertTrue(lblNoteWolox.exists)
        
        let btnLogin = buttons["btnLogin"]
        XCTAssertEqual(btnLogin.label, localizedString(Localizable.btnLogin.rawValue).uppercased())
        if (onTap) {
            btnLogin.tap()
        }
    }
}


func localizedString(_ key: String) -> String {
    let result = NSLocalizedString(key, bundle: Bundle(for: BookstoreUITests.self), comment: "")
    return result
}
