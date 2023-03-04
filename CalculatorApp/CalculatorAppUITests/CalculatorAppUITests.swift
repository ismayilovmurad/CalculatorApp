//
//  CalculatorAppUITests.swift
//  CalculatorAppUITests
//
//  Created by Murad Ismayilov on 04.03.23.
//

// MARK: The XCTest framework contains Apple’s default testing libraries
import XCTest

// MARK: A test should verify that a known set of inputs results in an expected set of outputs.
final class CalculatorAppUITests: XCTestCase {
    
    // MARK: You use setUpWithError() to ensure your app is in this known state before each test method begins.
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        
        // MARK: This line stops testing if a failure occurs. Setting this value to false stops the test process after the first failure.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    // MARK: You use tearDownWithError() to clean up after each test so that you’re back to a known starting condition for the next test.
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Test names must begin with test. If not, the testing framework ignores the method and will not execute it when testing.
    func testPressMemoryPlusAtAppStartShowZeroInDisplay() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let memoryButton = app.buttons["M+"]
        
        // MARK: This method simulates someone tapping on the button.
        memoryButton.tap()
        
        // MARK: You use the accessibility(identifier:) to find the display element in your app.
        let display = app.staticTexts["display"]
        // MARK: The result of the above code is an XCUIElement, as are most UI elements in a UI test. You want to investigate the label property of the element which contains the text of the label.
        let displayText = display.label
        // MARK: You use an assertion to verify the label matches the expected result. All testing assertions begin with the prefix XCT — a holdover from Objective-C naming conventions. In each test, you perform one or more assertions that determine if the test passes or fails.
        XCTAssert(displayText == "0")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testAddingTwoDigits() {
        let app = XCUIApplication()
        app.launch()
        
        let threeButton = app.buttons["3"]
        threeButton.tap()
        
        let addButton = app.buttons["+"]
        addButton.tap()
        let fiveButton = app.buttons["5"]
        fiveButton.tap()
        
        let equalButton = app.buttons["="]
        equalButton.tap()
        
        let display = app.staticTexts["display"]
        let displayText = display.label
        
        // MARK: XCTAssert() evaluates a condition and fails if it’s not true. If you had used the more specific XCTAssertEqual(displayText, "8") for the initial assertion, it would have provided the information you discovered using the debugger in the failure message. You used XCTAssert() to explore debugging a failed test.
        XCTAssertEqual(displayText, "8.0")
    }
    
    func testSwipeToClearMemory() {
        let app = XCUIApplication()
        app.launch()
        
        let threeButton = app.buttons["3"]
        threeButton.tap()
        let fiveButton = app.buttons["5"]
        fiveButton.tap()
        
        let memoryButton = app.buttons["M+"]
        memoryButton.tap()
        
        let memoryDisplay = app.staticTexts["memoryDisplay"]
        // MARK: The exists property on an XCUIElement is true when the element exists. If the memory display were not visible, then this assert would fail.
        XCTAssert(memoryDisplay.exists)
        // MARK: The swipeLeft() method produces a swipe action to the left on the calling element. There are additional methods for swipeRight(), swipeUp() and swipeDown().
        memoryDisplay.swipeLeft()
        // MARK: The XCTAssertFalse() test acts as an opposite for XCTAssert. It succeeds when the checked value is false instead of true. The swipe should set memory to zero after the gesture, and the action should hide the memory display, wiping it out of existence.
        XCTAssertFalse(memoryDisplay.exists)
    }
}
