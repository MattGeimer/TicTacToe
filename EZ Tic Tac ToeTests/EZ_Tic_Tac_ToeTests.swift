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
		gameState = GameState(singlePlayer: false, difficulty: .medium)
    }

    override func tearDown() {
		gameState = nil
		super.tearDown()
    }

	///Tests the receiveInput functionality
    func testReceiveInput() {
		XCTAssertEqual(gameState.receiveInput(position: .topLeft), .success)
		XCTAssertEqual(gameState.receiveInput(position: .topLeft), .occupied)
		XCTAssertEqual(gameState.receiveInput(position: .topMiddle), .success)
		XCTAssertEqual(gameState.receiveInput(position: .topLeft), .occupied)
		XCTAssertEqual(gameState.receiveInput(position: .middleLeft), .success)
		XCTAssertEqual(gameState.receiveInput(position: .center), .success)
		XCTAssertEqual(gameState.receiveInput(position: .bottomLeft), .success)
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
	
	/// Test how the AI reacts to the player starting in the center
	func testAIMakingWrongMoveStageOne() {
		gameState.setBoard(positionValues: [
			[.empty,.empty,.empty],
			[.empty,.x,.empty],
			[.empty,.empty,.empty]
		])
		
		let expectedMove: Position = .topLeft
		var actualMove: Position?
		
		measure {
			actualMove = gameState.findBestMove()
		}
		
		XCTAssertEqual(expectedMove, actualMove)
	}
	
	/// Test what happens after the user places an x in the opposing corner
	func testAIMakingWrongMoveStageTwoDiagonal() {
		gameState.setBoard(positionValues: [
			[.o,.empty,.empty],
			[.empty,.x,.empty],
			[.empty,.empty,.x]
		])
		
		let expectedMove: Position = .topRight
		var actualMove: Position?
		
		measure {
			actualMove = gameState.findBestMove()
		}
		
		XCTAssertEqual(expectedMove, actualMove)
	}
	
	/// Test what happens if the user places an x next to the previous o move
	func testAIMakingWrongMoveStageTwoVertical() {
		gameState.setBoard(positionValues: [
			[.o,.x,.empty],
			[.empty,.x,.empty],
			[.empty,.empty,.empty]
		])
		
		let expectedMove: Position = .bottomMiddle
		var actualMove: Position?
		
		measure {
			actualMove = gameState.findBestMove()
		}
		
		XCTAssertEqual(expectedMove, actualMove)
	}
}
