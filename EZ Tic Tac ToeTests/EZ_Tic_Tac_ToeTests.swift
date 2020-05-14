//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Matthew Geimer on 2/12/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import XCTest
@testable import EZ_Tic_Tac_Toe

///Tests the GameState class and receiveInput function
///- Author: Matt Geimer
///- Version: 1.0
class EZTicTacToeTests: XCTestCase {
	
	var gameState: GameState!
	
    override func setUp() {
		super.setUp()
		gameState = GameState(singlePlayer: false)
    }

    override func tearDown() {
		gameState = nil
		super.tearDown()
    }

	///Tests the receiveInput functionality
    func testReceiveInput() {
		XCTAssertTrue(gameState.receiveInput(position: .topLeft))
		XCTAssertFalse(gameState.receiveInput(position: .topLeft))
		XCTAssertTrue(gameState.receiveInput(position: .topMiddle))
		XCTAssertFalse(gameState.receiveInput(position: .topLeft))
		XCTAssertTrue(gameState.receiveInput(position: .middleLeft))
		XCTAssertTrue(gameState.receiveInput(position: .center))
		XCTAssertTrue(gameState.receiveInput(position: .bottomLeft))
		XCTAssert(gameState!.gameState == .xWins)
    }
	
	/// Tests what happens if there's a tie
	func testTieGameScenario() {
		gameState.setBoard(positionValues: [
			[.x, .x, .o],
			[.o, .o, .x],
			[.x, .o, .x]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .tie)
	}
	
	//Test X win conditions
	
	/// Tests what happens when X wins by capturing all positions in the top row
	func testHorizontalXWinTop() {
		gameState.setBoard(positionValues: [
			[.x, .x, .x],
			[.o, .o, .empty],
			[.empty, .empty, .empty]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .xWins)
	}
	
	/// Tests what happens when X wins by capturing all positions in the middle row
	func testHorizontalXWinMiddle() {
		gameState.setBoard(positionValues: [
			[.o, .o, .empty],
			[.x, .x, .x],
			[.empty, .empty, .empty]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .xWins)
	}
	
	/// Tests what happens when X wins by capturing all positions in the bottom row
	func testHorizontalXWinBottom() {
		gameState.setBoard(positionValues: [
			[.o, .o, .empty],
			[.empty, .empty, .empty],
			[.x, .x, .x]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .xWins)
	}
	
	/// Tests what happens when X wins by capturing all positions in the left column
	func testVerticalXWinLeft() {
		gameState.setBoard(positionValues: [
			[.x, .o, .empty],
			[.x, .o, .empty],
			[.x, .empty, .empty]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .xWins)
	}
	
	/// Tests what happens when X wins by capturing all positions in the middle column
	func testVerticalXWinMiddle() {
		gameState.setBoard(positionValues: [
			[.o, .x, .empty],
			[.o, .x, .empty],
			[.empty, .x, .empty]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .xWins)
	}
	
	/// Tests what happens when X wins by capturing all positions in the right column
	func testVerticalXWinRight() {
		gameState.setBoard(positionValues: [
			[.empty, .o, .x],
			[.empty, .o, .x],
			[.empty, .empty, .x]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .xWins)
	}
	
	/// Tests what happens when X wins by capturing the diagonal from the top left to the bottom right
	func testDiagonalXWinTopLeftToBottomRight() {
		gameState.setBoard(positionValues: [
			[.x, .o, .empty],
			[.o, .x, .empty],
			[.empty, .empty, .x]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .xWins)
	}
	
	/// Tests what happens when X wins by capturing the diagonal from the top right to the bottom left
	func testDiagonalXWinTopRightToBottomLeft() {
		gameState.setBoard(positionValues: [
			[.empty, .o, .x],
			[.o, .x, .empty],
			[.x, .empty, .empty]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .xWins)
	}
	
	//Test O win conditions
	
	/// Tests what happens when O wins by capturing all positions in the top row
	func testHorizontalOWinTop() {
		gameState.setBoard(positionValues: [
			[.o, .o, .o],
			[.x, .x, .empty],
			[.x, .empty, .empty]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .oWins)
    }
	
	/// Tests what happens when O wins by capturing all positions in the middle row
	func testHorizontalOWinMiddle() {
		gameState.setBoard(positionValues: [
			[.x, .x, .empty],
			[.o, .o, .o],
			[.x, .empty, .empty]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .oWins)
	}
	
	/// Tests what happens when O wins by capturing all positions in the bottom row
	func testHorizontalOWinBottom() {
		gameState.setBoard(positionValues: [
			[.empty, .empty, .empty],
			[.x, .x, .empty],
			[.o, .o, .o]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .oWins)
	}
	
	/// Tests what happens when O wins by capturing all positions in the left column
	func testVerticalOWinLeft() {
		gameState.setBoard(positionValues: [
			[.o, .x, .x],
			[.o, .x, .empty],
			[.o, .empty, .empty]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .oWins)
	}
	
	/// Tests what happens when O wins by capturing all positions in the middle column
	func testVerticalOWinMiddle() {
		gameState.setBoard(positionValues: [
			[.empty, .o, .x],
			[.x, .o, .empty],
			[.x, .o, .empty]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .oWins)
	}
	
	/// Tests what happens when O wins by capturing all positions in the right column
	func testVerticalOWinRight() {
		gameState.setBoard(positionValues: [
			[.empty, .empty, .o],
			[.x, .x, .o],
			[.x, .empty, .o]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .oWins)
	}
	
	/// Tests what happens when O wins by capturing the diagonal from the top left to the bottom right
	func testDiagonalOWinTopLeftToBottomRight() {
		gameState.setBoard(positionValues: [
			[.o, .empty, .x],
			[.x, .o, .empty],
			[.x, .empty, .o]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .oWins)
	}
	
	/// Tests what happens when O wins by capturing the diagonal from the top right to the bottom left
	func testDiagonalOWinTopRightToBottomLeft() {
		gameState.setBoard(positionValues: [
			[.x, .x, .o],
			[.x, .o, .empty],
			[.o, .empty, .empty]
		])
		gameState.updateGameState()
		XCTAssert(gameState!.gameState == .oWins)
	}
	
	func testAIMakingWrongMove() {
		gameState.setBoard(positionValues: [
			[.o,.x,.empty],
			[.empty,.x,.empty],
			[.empty,.empty,.empty]
		])
		
		let expectedMove: Position = .bottomMiddle
		let actualMove: Position = gameState.findBestMove()
		
		XCTAssertEqual(expectedMove, actualMove)
	}

}
