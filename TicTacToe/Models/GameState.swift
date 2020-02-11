//
//  GameState.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

class GameState: ObservableObject {
	
	let numberOfRows: Int = 3
	let numberOfColumns: Int = 3
	
	@Published var xPlayerTurn: Bool = true
	@Published var gameState: BoardState = .empty
	@Published var positionValues: [[PositionValue]] = [[.empty, .empty, .empty], [.empty, .empty, .empty], [.empty, .empty, .empty]]
	
	//Take an input of which position was played, and if the position is empty, set its state to whichever player's turn it is
	func receiveInput(position: Position) -> Bool {
		guard positionValues[position.coordinate.1][position.coordinate.0] == .empty else {
			return false
		}
		if xPlayerTurn {
			positionValues[position.coordinate.1][position.coordinate.0] = .x
		} else {
			positionValues[position.coordinate.1][position.coordinate.0] = .o
		}
		
		gameState = evaluateCurrentBoard()
		if gameState == .ongoing {
			xPlayerTurn.toggle()
		}
		
		return true
	}
	
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
	
	func evaluatePlayer(valueToLookFor: PositionValue) -> Bool {
		let horizontalWin = evaluateHorizontalWin(valueToLookFor: valueToLookFor)
		let verticalWin = evaluateVerticalWin(valueToLookFor: valueToLookFor)
		let diagonalTopLeft = evaluateDiagonalWinTopLeftBottomRight(valueToLookFor: valueToLookFor)
		let diagonalTopRight = evalutateDiagonalWinTopRightBottomLeft(valueToLookFor: valueToLookFor)
		return horizontalWin || verticalWin || diagonalTopLeft || diagonalTopRight
	}
	
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
	
	func evaluateDiagonalWinTopLeftBottomRight(valueToLookFor: PositionValue) -> Bool {
		var toReturn: Bool = true
		for index in 0 ..< numberOfRows {
			if positionValues[index][index] != valueToLookFor {
				toReturn = false
			}
		}
		return toReturn
	}
	
	func evalutateDiagonalWinTopRightBottomLeft(valueToLookFor: PositionValue) -> Bool {
		var toReturn: Bool = true
		for index in 0 ..< numberOfRows {
			if positionValues[index][numberOfRows - index - 1] != valueToLookFor {
				toReturn = false
			}
		}
		return toReturn
	}
	
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
}
