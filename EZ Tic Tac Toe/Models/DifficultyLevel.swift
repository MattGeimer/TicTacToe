//
//  DifficultyLevel.swift
//  EZ Tic Tac Toe
//
//  Created by Matthew Geimer on 5/25/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import Foundation

/// Represents different difficulty levers for the AI
enum DifficultyLevel {
	case easy, medium, hard
	
	/// The string to display the difficulty level as
	var toString: String {
		switch self {
			case .easy:
				return "Easy"
			case .medium:
				return "Medium"
			case .hard:
				return "Hard"
		}
	}
	
	/// The percentage of moves that will be random using a given difficulty level
	var percentageRandomMoves: Double {
		switch self {
		case .easy:
			return 3 / 4
		case .medium:
			return 1 / 2
		case .hard:
			return 0
		}
	}
}
