//
//  GameState.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

///Represents the current state of the board, including the values of each position and the overall state.
///- Author: Matt Geimer
///- Version: 1.0
class GameState: ObservableObject {
	
	let numberOfRows: Int = 3
	let numberOfColumns: Int = 3
	
	@Published var xPlayerTurn: Bool = true
	@Published var gameState: BoardState = .empty
	@Published var positionValues: [[PositionValue]] = [[.empty, .empty, .empty], [.empty, .empty, .empty], [.empty, .empty, .empty]]
	
	///Take an input of which position was played, and if the position is empty, set its state to whichever player's turn it is
	///- Parameter position: the position to be played as an enum (ex: .topLeft)
	///- Returns: true if position can be played, false otherwise
	func receiveInput(position: Position) -> Bool {
		guard positionValues[position.coordinate.1][position.coordinate.0] == .empty else {
			return false
		}
		if xPlayerTurn {
			positionValues[position.coordinate.1][position.coordinate.0] = .x
		} else {
			positionValues[position.coordinate.1][position.coordinate.0] = .o
		}
		
		updateGameState()
		
		return true
	}
	
	///Evaluates the current board to determine current game state, then determines whether to toggle which player's turn it is
	func updateGameState() {
		gameState = evaluateCurrentBoard()
		if gameState == .ongoing {
			xPlayerTurn.toggle()
		}
	}
	
	///Evaluates the current board to determine the appropriate BoardState
	///- Author: Matt Geimer
	///- Version: 1.0
	///- Returns: The new board state based on the current state of the board.
	func evaluateCurrentBoard() -> BoardState {
		if evaluatePlayer(valueToLookFor: .x) {
			return .xWins
		} else if evaluatePlayer(valueToLookFor: .o) {
			return .oWins
		} else if evaluteTie() {
			return .tie
		} else {
			return .ongoing
		}
	}
	
	///Checks if the player has won through any configuration
	///- Author: Matt Geimer
	///- Version: 1.0
	///- Parameter valueToLookFor: the player value to look for (ex: .x or .o)
	///- Returns: Whether the player has won through any configuration
	func evaluatePlayer(valueToLookFor: PositionValue) -> Bool {
		let horizontalWin = evaluateHorizontalWin(valueToLookFor: valueToLookFor)
		let verticalWin = evaluateVerticalWin(valueToLookFor: valueToLookFor)
		let diagonalTopLeft = evaluateDiagonalWinTopLeftBottomRight(valueToLookFor: valueToLookFor)
		let diagonalTopRight = evalutateDiagonalWinTopRightBottomLeft(valueToLookFor: valueToLookFor)
		
		return horizontalWin || verticalWin || diagonalTopLeft || diagonalTopRight
	}
	
	///Checks if the board has any empty positions remaining
	///- Author: Matt Geimer
	///- Version: 1.0
	///- Returns: Whether the entire board contains no empty positions
	func evaluteTie() -> Bool {
		for row in 0 ..< numberOfRows {
			for column in 0 ..< numberOfColumns {
				if positionValues[row][column] == .empty {
					return false
				}
			}
		}
		
		return true
	}
	
	///Checks if the player has won through any horizontal configuration
	///- Author: Matt Geimer
	///- Version: 1.0
	///- Parameter valueToLookFor: the player value to look for (ex: .x or .o)
	///- Returns: Whether the player has won through any row
	func evaluateHorizontalWin(valueToLookFor: PositionValue) -> Bool {
		var toReturn: Bool = true
		for row in 0 ..< numberOfRows {
			toReturn = true
			for column in 0 ..< numberOfColumns {
				if positionValues[row][column] != valueToLookFor {
					toReturn = false
					break
				}
			}
			if toReturn {
				break
			}
		}
		
		return toReturn
	}
	
	///Checks if the player has won through any vertical configuration
	///- Author: Matt Geimer
	///- Version: 1.0
	///- Parameter valueToLookFor: the player value to look for (ex: .x or .o)
	///- Returns: Whether the player has won through any column
	func evaluateVerticalWin(valueToLookFor: PositionValue) -> Bool {
		var toReturn: Bool = true
		for column in 0 ..< numberOfColumns {
			toReturn = true
			for row in 0 ..< numberOfRows {
				if positionValues[row][column] != valueToLookFor {
					toReturn = false
					break
				}
			}
			if toReturn {
				break
			}
		}
		
		return toReturn
	}
	
	///Checks if the player has won through a diagonal configuration from the top left to the bottom right
	///- Author: Matt Geimer
	///- Version: 1.0
	///- Parameter valueToLookFor: the player value to look for (ex: .x or .o)
	///- Returns: Whether the player has won through a diagonal configuration from the top left to the bottom right
	func evaluateDiagonalWinTopLeftBottomRight(valueToLookFor: PositionValue) -> Bool {
		var toReturn: Bool = true
		for index in 0 ..< numberOfRows {
			if positionValues[index][index] != valueToLookFor {
				toReturn = false
			}
		}
		
		return toReturn
	}
	
	///Checks if the player has won through a diagonal configuration from the top right to the bottom left
	///- Author: Matt Geimer
	///- Version: 1.0
	///- Parameter valueToLookFor: the player value to look for (ex: .x or .o)
	///- Returns: Whether the player has won through a diagonal configuration from the top right to the bottom left
	func evalutateDiagonalWinTopRightBottomLeft(valueToLookFor: PositionValue) -> Bool {
		var toReturn: Bool = true
		for index in 0 ..< numberOfRows {
			if positionValues[index][numberOfRows - index - 1] != valueToLookFor {
				toReturn = false
			}
		}
		
		return toReturn
	}
	
	///Resets the game to the beginning position (xPlayerTurn to true, positionValues to empty, gameState to .empty)
	///- Author: Matt Geimer
	///- Version: 1.0
	func resetGame() {
		var newPositionValues: [[PositionValue]] = []
		for row in positionValues {
			var currentRow: [PositionValue] = []
			for _ in row {
				currentRow.append(.empty)
			}
			newPositionValues.append(currentRow)
		}
		positionValues = newPositionValues
		xPlayerTurn = true
		gameState = .empty
	}
	
	///Sets board to given 2d array
	///- Author: Matt Geimer
	///- Version: 1.0
	func setBoard(positionValues: [[PositionValue]]) {
		self.positionValues = positionValues
	}
}
