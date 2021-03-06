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
	
	@Published var singlePlayer: Bool
	@Published var xPlayerTurn: Bool = true
	@Published var gameState: BoardState = .empty
	@Published var difficulty: DifficultyLevel = .hard
	var positionValues: [[PositionValue]] = [[.empty, .empty, .empty], [.empty, .empty, .empty], [.empty, .empty, .empty]]
	
	init(singlePlayer: Bool, difficulty: DifficultyLevel) {
		self.singlePlayer = singlePlayer
		self.difficulty = difficulty
	}
	
	///Take an input of which position was played, and if the position is empty, set its state to whichever player's turn it is
	///- Parameter position: the position to be played as an enum (ex: .topLeft)
	///- Returns: true if position can be played, false otherwise
	func receiveInput(position: Position) -> InputResult {
		guard positionValues[position.coordinate.1][position.coordinate.0] == .empty else {
			return .occupied
		}
		
		if xPlayerTurn {
			positionValues[position.coordinate.1][position.coordinate.0] = .x
		} else if !singlePlayer {
			positionValues[position.coordinate.1][position.coordinate.0] = .o
		} else {
			return .notPlayerTurn
		}
		
		updateGameState()
		
		return .success
	}
	
	///Evaluates the current board to determine current game state, then determines whether to toggle which player's turn it is
	func updateGameState() {
		gameState = evaluateCurrentBoard()
		if gameState == .ongoing {
			xPlayerTurn.toggle()
			
			if (singlePlayer && !xPlayerTurn) {
				DispatchQueue(label: "Minimax", qos: .userInitiated).async {
					let move: Position = self.getMoveForAI()
					DispatchQueue.main.async {
						self.setPosition(position: move, value: .o)
						self.updateGameState()
					}
				}
			}
		}
	}
	
	/// Using the difficulty level, picks a move for the AI to make (uses random moves sometimes, even if they're not the best move)
	/// - Returns: The move for the AI to make
	func getMoveForAI() -> Position {
		let randomMoveNumber = Double.random(in: 0 ... 1)
		
		if randomMoveNumber < difficulty.percentageRandomMoves {
			var row = Int.random(in: 0 ..< numberOfRows)
			var col = Int.random(in: 0 ..< numberOfColumns)
			
			while (positionValues[row][col] != .empty) {
				row = Int.random(in: 0 ..< numberOfRows)
				col = Int.random(in: 0 ..< numberOfColumns)
			}
			
			return Position.getCoordinate(x: col, y: row)
		} else {
			return findBestMove()
		}
	}
	
	///Determine the best move for the AI
	///- Version: 1.0
	///- Returns: The best position that the AI could make given the current board
	func findBestMove() -> Position {
		var bestCase = Int.min
		var bestMove:Position?
		
		for row in 0 ..< numberOfRows {
			for col in 0 ..< numberOfColumns {
				if (positionValues[row][col] == .empty) {
					let newBoard = GameState(singlePlayer: true, difficulty: self.difficulty)
					newBoard.setBoard(positionValues: positionValues)
					
					let newPosition = Position.getCoordinate(x: col, y: row)
					newBoard.setPosition(position: newPosition, value: .o)
					
					let result = GameState.minimax(newBoard, maximizing: false, originalPlayer: .o, depth: 0)
					
					if (result > bestCase) {
						bestCase = result
						bestMove = Position.getCoordinate(x: col, y: row)
					}
				}
			}
		}
		
		var row = Int.random(in: 0 ..< numberOfRows)
		var col = Int.random(in: 0 ..< numberOfColumns)
		
		while (positionValues[row][col] != .empty) {
			row = Int.random(in: 0 ..< numberOfRows)
			col = Int.random(in: 0 ..< numberOfColumns)
		}
		
		return bestMove ?? Position.getCoordinate(x: col, y: row)
	}
	
	/// Evaluates the value of a board and how the game would play out after it.
	/// - Version: 1.0
	/// - Parameters:
	///   - board: The current board to evaluate
	///   - maximizing: Whether the algorithm is maximizing or minimizing this turn (this is analagous to whether it's playing for the AI or the opponent)
	///   - originalPlayer: Whether the AI is playing X's or O's
	///   - depth: What number recursive call this is. This is used to compute how far out the algorithm is thinking, and to make moves that have benefits later on less valuable
	/// - Returns: The score of the board (number of games won - number of games lost)
	static func minimax(_ board: GameState, maximizing: Bool, originalPlayer: PositionValue, depth: Int) -> Int {
		//Base case: The board is full or a player has won. Return 1 if our player won, 0 if it was a tie, or -1 if our player lost
		if ((board.evaluateCurrentBoard() == .xWins && originalPlayer == .x)
			|| (board.evaluateCurrentBoard() == .oWins && originalPlayer == .o)) {
			return 10 - depth
		} else if (board.evaluateCurrentBoard() == .tie) {
			return 0
		} else if ((board.evaluateCurrentBoard() == .xWins && originalPlayer == .o)
			|| (board.evaluateCurrentBoard() == .oWins && originalPlayer == .x)) {
			return -10 + depth
		}
		
		var positionValueToPlace: PositionValue {
			if originalPlayer == .o {
				if maximizing {
					return .o
				} else {
					return .x
				}
			} else {
				if maximizing {
					return .x
				} else {
					return .o
				}
			}
		}
		
		//Recursive Case: return the sum of the values of the rest of the board being played out.
		var evaluation = maximizing ? Int.min : Int.max
		
		for row in 0 ..< board.numberOfRows {
			for col in 0 ..< board.numberOfColumns {
				if (board.positionValues[row][col] == .empty) {
					let newBoard = GameState(singlePlayer: true, difficulty: board.difficulty)
					newBoard.setBoard(positionValues: board.positionValues)
					
					let newPosition = Position.getCoordinate(x: col, y: row)
					newBoard.setPosition(position: newPosition, value: positionValueToPlace)
					
					let result = minimax(newBoard, maximizing: maximizing ? false : true, originalPlayer: originalPlayer, depth: depth + 1)
					
					evaluation = maximizing ? max(result, evaluation) : min(result, evaluation)
				}
			}
		}
		
		return evaluation
	}
	
	///Evaluates the current board to determine the appropriate BoardState
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
	///- Version: 1.0
	func setBoard(positionValues: [[PositionValue]]) {
		self.positionValues = positionValues
	}
	
	///Sets a position to the desired value
	///- Author: Matt Geimer
	///- Version: 1.0
	func setPosition(position: Position, value: PositionValue) {
		guard positionValues[position.coordinate.1][position.coordinate.0] == .empty else {
			return
		}
		
		positionValues[position.coordinate.1][position.coordinate.0] = value
	}
}
