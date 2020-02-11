//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Matthew Geimer on 2/11/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import XCTest

/**
Tests Tic Tac Toe app user interface to determine if any issues arise.
- Author: Matt Geimer
- Version: 0.1
*/
class TicTacToeUITests: XCTestCase {
	
	private var app: XCUIApplication!
	
	/// Instantiates app and launches it.
    override func setUp() {
        continueAfterFailure = false
		app = XCUIApplication()
		app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	//Test X win conditions
	
	/// Tests what happens when the user presses the same button twice
	func testPressedButtonTwice() {
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		let elementsQuery = app.alerts["Move Invalid"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["Move Invalid"].exists)
		elementsQuery.buttons["Cancel"].tap()
	}
	
	/// Tests what happens when X wins by capturing all positions in the top row
	func testHorizontalXWinTop() {
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["middleLeft"].tap()
		XCUIApplication().buttons["topMiddle"].tap()
		XCUIApplication().buttons["center"].tap()
		XCUIApplication().buttons["topRight"].tap()
		
		let elementsQuery = app.alerts["X wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["X wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when X wins by capturing all positions in the middle row
	func testHorizontalXWinMiddle() {
		XCUIApplication().buttons["middleLeft"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["center"].tap()
		XCUIApplication().buttons["topMiddle"].tap()
		XCUIApplication().buttons["middleRight"].tap()
		
		let elementsQuery = app.alerts["X wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["X wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when X wins by capturing all positions in the bottom row
	func testHorizontalXWinBottom() {
		XCUIApplication().buttons["bottomLeft"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["bottomMiddle"].tap()
		XCUIApplication().buttons["topMiddle"].tap()
		XCUIApplication().buttons["bottomRight"].tap()
		
		let elementsQuery = app.alerts["X wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["X wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when X wins by capturing all positions in the left column
	func testVerticalXWinLeft() {
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["topRight"].tap()
		XCUIApplication().buttons["middleLeft"].tap()
		XCUIApplication().buttons["middleRight"].tap()
		XCUIApplication().buttons["bottomLeft"].tap()
		
		let elementsQuery = app.alerts["X wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["X wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when X wins by capturing all positions in the middle column
	func testVerticalXWinMiddle() {
		XCUIApplication().buttons["topMiddle"].tap()
		XCUIApplication().buttons["topRight"].tap()
		XCUIApplication().buttons["center"].tap()
		XCUIApplication().buttons["middleRight"].tap()
		XCUIApplication().buttons["bottomMiddle"].tap()
		
		let elementsQuery = app.alerts["X wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["X wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when X wins by capturing all positions in the right column
	func testVerticalXWinRight() {
		XCUIApplication().buttons["topRight"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["middleRight"].tap()
		XCUIApplication().buttons["middleLeft"].tap()
		XCUIApplication().buttons["bottomRight"].tap()
		
		let elementsQuery = app.alerts["X wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["X wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when X wins by capturing the diagonal from the top left to the bottom right
	func testDiagonalXWinTopLeftToBottomRight() {
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["topRight"].tap()
		XCUIApplication().buttons["center"].tap()
		XCUIApplication().buttons["middleRight"].tap()
		XCUIApplication().buttons["bottomRight"].tap()
		
		let elementsQuery = app.alerts["X wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["X wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when X wins by capturing the diagonal from the top right to the bottom left
	func testDiagonalXWinTopRightToBottomLeft() {
		XCUIApplication().buttons["topRight"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["center"].tap()
		XCUIApplication().buttons["middleLeft"].tap()
		XCUIApplication().buttons["bottomLeft"].tap()
		
		let elementsQuery = app.alerts["X wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["X wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	//Test O win conditions
	
	/// Tests what happens when O wins by capturing all positions in the top row
	func testHorizontalOWinTop() {
		XCUIApplication().buttons["bottomLeft"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["middleLeft"].tap()
		XCUIApplication().buttons["topMiddle"].tap()
		XCUIApplication().buttons["center"].tap()
		XCUIApplication().buttons["topRight"].tap()
		
		let elementsQuery = app.alerts["O wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["O wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
    }
	
	/// Tests what happens when O wins by capturing all positions in the middle row
	func testHorizontalOWinMiddle() {
		XCUIApplication().buttons["bottomLeft"].tap()
		XCUIApplication().buttons["middleLeft"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["center"].tap()
		XCUIApplication().buttons["topMiddle"].tap()
		XCUIApplication().buttons["middleRight"].tap()
		
		let elementsQuery = app.alerts["O wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["O wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when O wins by capturing all positions in the bottom row
	func testHorizontalOWinBottom() {
		XCUIApplication().buttons["middleLeft"].tap()
		XCUIApplication().buttons["bottomLeft"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["bottomMiddle"].tap()
		XCUIApplication().buttons["topMiddle"].tap()
		XCUIApplication().buttons["bottomRight"].tap()
		
		let elementsQuery = app.alerts["O wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["O wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when O wins by capturing all positions in the left column
	func testVerticalOWinLeft() {
		XCUIApplication().buttons["center"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["topRight"].tap()
		XCUIApplication().buttons["middleLeft"].tap()
		XCUIApplication().buttons["middleRight"].tap()
		XCUIApplication().buttons["bottomLeft"].tap()
		
		let elementsQuery = app.alerts["O wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["O wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when O wins by capturing all positions in the middle column
	func testVerticalOWinMiddle() {
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["topMiddle"].tap()
		XCUIApplication().buttons["topRight"].tap()
		XCUIApplication().buttons["center"].tap()
		XCUIApplication().buttons["middleRight"].tap()
		XCUIApplication().buttons["bottomMiddle"].tap()
		
		let elementsQuery = app.alerts["O wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["O wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when O wins by capturing all positions in the right column
	func testVerticalOWinRight() {
		XCUIApplication().buttons["center"].tap()
		XCUIApplication().buttons["topRight"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["middleRight"].tap()
		XCUIApplication().buttons["middleLeft"].tap()
		XCUIApplication().buttons["bottomRight"].tap()
		
		let elementsQuery = app.alerts["O wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["O wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when O wins by capturing the diagonal from the top left to the bottom right
	func testDiagonalOWinTopLeftToBottomRight() {
		XCUIApplication().buttons["middleLeft"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["topRight"].tap()
		XCUIApplication().buttons["center"].tap()
		XCUIApplication().buttons["middleRight"].tap()
		XCUIApplication().buttons["bottomRight"].tap()
		
		let elementsQuery = app.alerts["O wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["O wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when O wins by capturing the diagonal from the top right to the bottom left
	func testDiagonalOWinTopRightToBottomLeft() {
		XCUIApplication().buttons["middleRight"].tap()
		XCUIApplication().buttons["topRight"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["center"].tap()
		XCUIApplication().buttons["middleLeft"].tap()
		XCUIApplication().buttons["bottomLeft"].tap()
		
		let elementsQuery = app.alerts["O wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["O wins!"].exists)
		elementsQuery.buttons["Cancel"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
}
