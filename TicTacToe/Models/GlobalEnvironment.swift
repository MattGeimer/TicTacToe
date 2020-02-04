//
//  GlobalEnvironment.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

class GlobalEnvironment: ObservableObject {
	var xPlayerTurn: Bool = true
	@Published var gameOver: Bool = false
	@Published var positionValues: [[PositionValue]] = [[.empty, .empty, .empty], [.empty, .empty, .empty], [.empty, .empty, .empty]]
	
	//Take an input of which position was played, and if the position is empty, set its state to whichever player's turn it is
	func receiveInput(position: Position) -> Bool {
		guard positionValues[position.coordinate.1][position.coordinate.0] == .empty else {
			gameOver = true
			return false
		}
		if xPlayerTurn {
			positionValues[position.coordinate.1][position.coordinate.0] = .x
		} else {
			positionValues[position.coordinate.1][position.coordinate.0] = .o
		}
		xPlayerTurn.toggle()
		return true
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
		gameOver = false
	}
}
