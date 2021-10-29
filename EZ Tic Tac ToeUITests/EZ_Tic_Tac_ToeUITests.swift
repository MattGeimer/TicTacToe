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
- Version: 1.0
*/
class EZTicTacToeUITests: XCTestCase {
	
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
	
	func startMultiplayerGame() {
		let multiplayerGameButton: XCUIElement = XCUIApplication().buttons["multiplayer"]
		XCTAssertTrue(multiplayerGameButton.exists)
		multiplayerGameButton.tap()
        sleep(1)
	}
	
	//Test edge cases
	
	/// Tests what happens when the user presses the same button twice
	func testPressedButtonTwice() {
		startMultiplayerGame()
		
		XCUIApplication().buttons["topLeft"].tap()
		XCUIApplication().buttons["topLeft"].tap()
		let elementsQuery = app.alerts["Move Invalid"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["Move Invalid"].exists)
		elementsQuery.buttons["OK"].tap()
	}
	
	/// Tests what happens if there's a tie
	func testTieGameScenario() {
		startMultiplayerGame()
		
		XCUIApplication().buttons["topLeft"].tap()
        sleep(1)
		XCUIApplication().buttons["topMiddle"].tap()
        sleep(1)
		XCUIApplication().buttons["topRight"].tap()
        sleep(1)
		XCUIApplication().buttons["center"].tap()
        sleep(1)
		XCUIApplication().buttons["middleLeft"].tap()
        sleep(1)
		XCUIApplication().buttons["middleRight"].tap()
        sleep(1)
		XCUIApplication().buttons["bottomRight"].tap()
        sleep(1)
		XCUIApplication().buttons["bottomLeft"].tap()
        sleep(1)
		XCUIApplication().buttons["bottomMiddle"].tap()
		
		sleep(1)
		
		let elementsQuery = app.alerts["Tie Game"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["Tie Game"].exists)
		elementsQuery.buttons["OK"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests whether the new game button clears the board
	func testNewGameButton() {
		startMultiplayerGame()
		
		XCUIApplication().buttons["topLeft"].tap()
        sleep(1)
		XCUIApplication().buttons["topMiddle"].tap()
        sleep(1)
		XCUIApplication().buttons["topRight"].tap()
        sleep(1)
		XCUIApplication().buttons["center"].tap()
        sleep(1)
		XCUIApplication().buttons["middleLeft"].tap()
        sleep(1)
		XCUIApplication().buttons["middleRight"].tap()
        sleep(1)
		XCUIApplication().buttons["bottomRight"].tap()
        sleep(1)
		XCUIApplication().buttons["bottomLeft"].tap()
        sleep(1)
		XCUIApplication().buttons["bottomMiddle"].tap()
		
		sleep(1)
		
		let elementsQuery = app.alerts["Tie Game"].scrollViews.otherElements
		elementsQuery.buttons["OK"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
		newGameButton.tap()
		XCTAssertTrue(XCUIApplication().buttons["topLeft"].label == " ")
		XCTAssertTrue(XCUIApplication().buttons["topMiddle"].label == " ")
		XCTAssertTrue(XCUIApplication().buttons["topRight"].label == " ")
		XCTAssertTrue(XCUIApplication().buttons["middleLeft"].label == " ")
		XCTAssertTrue(XCUIApplication().buttons["center"].label == " ")
		XCTAssertTrue(XCUIApplication().buttons["middleRight"].label == " ")
		XCTAssertTrue(XCUIApplication().buttons["bottomLeft"].label == " ")
		XCTAssertTrue(XCUIApplication().buttons["bottomMiddle"].label == " ")
		XCTAssertTrue(XCUIApplication().buttons["bottomRight"].label == " ")
	}
	
	/// Tests what happens when X wins
	func testHorizontalX() {
		startMultiplayerGame()
		
		XCUIApplication().buttons["topLeft"].tap()
        sleep(1)
		XCUIApplication().buttons["middleLeft"].tap()
        sleep(1)
		XCUIApplication().buttons["topMiddle"].tap()
        sleep(1)
		XCUIApplication().buttons["center"].tap()
        sleep(1)
		XCUIApplication().buttons["topRight"].tap()
		
		sleep(1)
		
		let elementsQuery = app.alerts["X wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["X wins!"].exists)
		elementsQuery.buttons["OK"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
	}
	
	/// Tests what happens when O
	func testHorizontalOWin() {
		startMultiplayerGame()
		
		XCUIApplication().buttons["bottomLeft"].tap()
        sleep(1)
		XCUIApplication().buttons["topLeft"].tap()
        sleep(1)
		XCUIApplication().buttons["middleLeft"].tap()
        sleep(1)
		XCUIApplication().buttons["topMiddle"].tap()
        sleep(1)
		XCUIApplication().buttons["center"].tap()
        sleep(1)
		XCUIApplication().buttons["topRight"].tap()
		
		sleep(1)
		
		let elementsQuery = app.alerts["O wins!"].scrollViews.otherElements
		XCTAssertTrue(app.alerts["O wins!"].exists)
		elementsQuery.buttons["OK"].tap()
		
		let newGameButton: XCUIElement = XCUIApplication().buttons["newGameButton"]
		XCTAssertTrue(newGameButton.exists)
    }
}
