//
//  Comments.swift
//  CalculatorApp
//
//  Created by Murad Ismayilov on 04.03.23.
//

// MARK: Go to File ▸ New ▸ Target…. Select iOS and scroll down to find the Test section. Click UI Testing Bundle and click Next.

// MARK: There are three types of tests that you’ll use in your apps. In order of increasing complexity:

// MARK: Unit Tests (The base of all testing, and the foundation of all other tests, is the unit test. Each unit test ensures that you get the expected output when a function processes a given input. Multiple unit tests may test the same piece of code, but each unit test itself should only focus on a single unit of code. A unit test should take milliseconds to execute. You’ll run them often, so you want them to run fast. A unit test would verify that the calculateTotal() method in your app returns the correct amount for an order. A UI test begins with the app in the “just started” state, so you can write each test as though the app has just started.)

// MARK: Integration Tests (Integration tests verify how well different parts of your code work with each other, and how well your app works with the world outside of the app, such as against external APIs. Integration tests are more complex than unit tests; they usually take longer to run, and as a result, you’ll run them less often. An integration test would verify that your app correctly determines that the items in the order are in stock.)

// MARK: User Interface Tests (The most complex test is the user interface test, or UI test; these tests verify the user-facing behavior of your app. They simulate user interaction with the app and verify the user interface behaves as expected after responding to the interaction. A UI test would verify that after adding an item to an order, the amount displayed to the user displays the correct value.)

// MARK: Prior to Xcode 13, you could also run the preview in debug mode. Apple removed this feature in Xcode 13 and you must now use the simulator or a device to debug your app’s views. Breakpoints will be ignored by the preview.

// MARK: Using breakpoints does more than halt code; it can also tell you whether or not the execution of the app actually reached this piece of code. If a breakpoint doesn’t trigger, then you know something caused the app to skip the code.

// MARK: When stopped at a breakpoint, you’ll see a toolbar between the code editor and debug area. The first button in this toolbar toggles the visibility of the debug area. The second button disables all breakpoints but doesn’t delete them. The third button continues the execution of the app. You can also select Debug ▸ Continue in the menu to continue app execution. The next three buttons allow you to step through your code. Clicking the first executes the current line of code, including any method or function calls. The second button also executes the current line of code, but if there is a method call, it pauses at the first line of code inside that method or function. The final button executes code through to the end of the current method or function.

// MARK: At the (lldb) prompt in the console, execute the following: "po _memory" The po command in the console lets you examine the state of an object. The underscore in front of the variable name is for SwiftUI files.

// MARK: Once you have the (lldb) prompt in the console, enter po app. You’re examining the app object, which you declared as an XCUIApplication, a subclass of XCUIElement. You’ll be working with this object in all of your UI tests. The app object contains a tree that begins with the application and continues through all of the UI elements in your app. Each of these elements is also of type XCUIElement. You’ll access the UI elements in your app by running filter queries against the app object to select items in the tree that you see.

// MARK: SwiftUI apps render to the native elements of the platform; they’re not new components. Even though SwiftUI provides a new way to define an interface, it still uses the existing elements of the platform. A SwiftUI Button becomes a UIButton on iOS and a NSButton on macOS.

// MARK: In a UI test, the known set of inputs to your test is the set of interactions with the app.

// MARK: Ideally, you would be building out your UI tests at the same time as you built out your UI. This way, as your UI becomes more fleshed out, your test suite will expand along with it. However, with the realities of modern development, you’ll usually be adding tests after the application already exists.

// MARK: There are many testing elements beyond those discussed in this chapter. Some of the common attributes and methods that you haven’t had a chance to use in this chapter are:

// .isHittable: An element is hittable if the element exists and the user can click, tap or press it at its current location. An offscreen element exists but is not hittable.

// .typeText(): This method acts as though the user types the text into the calling control.

// .press(forDuration:): This allows you to perform a one-finger touch for a specified amount of time.

// .press(forDuration:thenDragTo:): The swipe methods provide no guarantee of the velocity of the gesture. You can use this method to perform a more precise drag action.

// .waitForExistence(): Useful to pause when an element may not appear on the screen immediately.

// MARK: Different platforms often need different user interface tests. Use conditional compilation to match tests to the platform and operating system.
