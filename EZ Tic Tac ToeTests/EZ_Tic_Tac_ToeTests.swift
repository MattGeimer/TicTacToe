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
    func testReceiveInput() async {
        let expectedResults: [(Position, GameState.MoveResult)] = [
            (.topLeft, .success),
            (.topLeft, .occupied),
            (.topMiddle, .success),
            (.topLeft, .occupied),
            (.middleLeft, .success),
            (.center, .success),
            (.bottomLeft, .success)
        ]
        
        for expectedResult in expectedResults {
            let actualResult = await gameState.makeMove(position: expectedResult.0)
            XCTAssertEqual(actualResult, expectedResult.1)
        }
        
		XCTAssert(gameState!.gamePhase == .xWins)
    }
	
	/// Tests what happens if there's a tie
	func testTieGameScenario() async {
		gameState.setBoard(positionValues: [
			[.x, .x, .o],
			[.o, .o, .x],
			[.x, .o, .x]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .tie)
	}
	
	//Test X win conditions
	
	/// Tests what happens when X wins by capturing all positions in the top row
	func testHorizontalXWinTop() async {
		gameState.setBoard(positionValues: [
			[.x, .x, .x],
			[.o, .o, .empty],
			[.empty, .empty, .empty]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .xWins)
	}
	
	/// Tests what happens when X wins by capturing all positions in the middle row
	func testHorizontalXWinMiddle() async {
		gameState.setBoard(positionValues: [
			[.o, .o, .empty],
			[.x, .x, .x],
			[.empty, .empty, .empty]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .xWins)
	}
	
	/// Tests what happens when X wins by capturing all positions in the bottom row
	func testHorizontalXWinBottom() async {
		gameState.setBoard(positionValues: [
			[.o, .o, .empty],
			[.empty, .empty, .empty],
			[.x, .x, .x]
		])
        await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .xWins)
	}
	
	/// Tests what happens when X wins by capturing all positions in the left column
	func testVerticalXWinLeft() async {
		gameState.setBoard(positionValues: [
			[.x, .o, .empty],
			[.x, .o, .empty],
			[.x, .empty, .empty]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .xWins)
	}
	
	/// Tests what happens when X wins by capturing all positions in the middle column
	func testVerticalXWinMiddle() async {
		gameState.setBoard(positionValues: [
			[.o, .x, .empty],
			[.o, .x, .empty],
			[.empty, .x, .empty]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .xWins)
	}
	
	/// Tests what happens when X wins by capturing all positions in the right column
	func testVerticalXWinRight() async {
		gameState.setBoard(positionValues: [
			[.empty, .o, .x],
			[.empty, .o, .x],
			[.empty, .empty, .x]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .xWins)
	}
	
	/// Tests what happens when X wins by capturing the diagonal from the top left to the bottom right
	func testDiagonalXWinTopLeftToBottomRight() async {
		gameState.setBoard(positionValues: [
			[.x, .o, .empty],
			[.o, .x, .empty],
			[.empty, .empty, .x]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .xWins)
	}
	
	/// Tests what happens when X wins by capturing the diagonal from the top right to the bottom left
	func testDiagonalXWinTopRightToBottomLeft() async {
		gameState.setBoard(positionValues: [
			[.empty, .o, .x],
			[.o, .x, .empty],
			[.x, .empty, .empty]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .xWins)
	}
	
	//Test O win conditions
	
	/// Tests what happens when O wins by capturing all positions in the top row
	func testHorizontalOWinTop() async {
		gameState.setBoard(positionValues: [
			[.o, .o, .o],
			[.x, .x, .empty],
			[.x, .empty, .empty]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .oWins)
    }
	
	/// Tests what happens when O wins by capturing all positions in the middle row
	func testHorizontalOWinMiddle() async {
		gameState.setBoard(positionValues: [
			[.x, .x, .empty],
			[.o, .o, .o],
			[.x, .empty, .empty]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .oWins)
	}
	
	/// Tests what happens when O wins by capturing all positions in the bottom row
	func testHorizontalOWinBottom() async {
		gameState.setBoard(positionValues: [
			[.empty, .empty, .empty],
			[.x, .x, .empty],
			[.o, .o, .o]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .oWins)
	}
	
	/// Tests what happens when O wins by capturing all positions in the left column
	func testVerticalOWinLeft() async {
		gameState.setBoard(positionValues: [
			[.o, .x, .x],
			[.o, .x, .empty],
			[.o, .empty, .empty]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .oWins)
	}
	
	/// Tests what happens when O wins by capturing all positions in the middle column
	func testVerticalOWinMiddle() async {
		gameState.setBoard(positionValues: [
			[.empty, .o, .x],
			[.x, .o, .empty],
			[.x, .o, .empty]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .oWins)
	}
	
	/// Tests what happens when O wins by capturing all positions in the right column
	func testVerticalOWinRight() async {
		gameState.setBoard(positionValues: [
			[.empty, .empty, .o],
			[.x, .x, .o],
			[.x, .empty, .o]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .oWins)
	}
	
	/// Tests what happens when O wins by capturing the diagonal from the top left to the bottom right
	func testDiagonalOWinTopLeftToBottomRight() async {
		gameState.setBoard(positionValues: [
			[.o, .empty, .x],
			[.x, .o, .empty],
			[.x, .empty, .o]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .oWins)
	}
	
	/// Tests what happens when O wins by capturing the diagonal from the top right to the bottom left
	func testDiagonalOWinTopRightToBottomLeft() async {
		gameState.setBoard(positionValues: [
			[.x, .x, .o],
			[.x, .o, .empty],
			[.o, .empty, .empty]
		])
		await gameState.updateGameState()
		XCTAssert(gameState!.gamePhase == .oWins)
	}
	
	/// Test how the AI reacts to the player starting in the center
	func testAIMakingWrongMoveStageOne() async {
		gameState.setBoard(positionValues: [
			[.empty,.empty,.empty],
			[.empty,.x,.empty],
			[.empty,.empty,.empty]
		])
		
		let expectedMove: Position = .topLeft
		var actualMove: Position?
		
		measure {
            gameState.findBestMove { position in
                actualMove = position
                XCTAssertEqual(expectedMove, actualMove)
            }
		}
	}
	
	/// Test what happens after the user places an x in the opposing corner
	func testAIMakingWrongMoveStageTwoDiagonal() async {
		gameState.setBoard(positionValues: [
			[.o,.empty,.empty],
			[.empty,.x,.empty],
			[.empty,.empty,.x]
		])
		
		let expectedMove: Position = .topRight
		var actualMove: Position?
		
		measure {
            gameState.findBestMove { position in
                actualMove = position
                XCTAssertEqual(expectedMove, actualMove)
            }
		}
	}
	
	/// Test what happens if the user places an x next to the previous o move
	func testAIMakingWrongMoveStageTwoVertical() async {
		gameState.setBoard(positionValues: [
			[.o,.x,.empty],
			[.empty,.x,.empty],
			[.empty,.empty,.empty]
		])
		
		let expectedMove: Position = .bottomMiddle
		var actualMove: Position?
		
		measure {
            gameState.findBestMove { position in
                actualMove = position
                XCTAssertEqual(expectedMove, actualMove)
            }
		}
	}
}
