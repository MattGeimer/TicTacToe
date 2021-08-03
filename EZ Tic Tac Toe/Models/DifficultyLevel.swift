//
//  DifficultyLevel.swift
//  EZ Tic Tac Toe
//
//  Created by Matthew Geimer on 5/25/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import Foundation

/// Represents different difficulty levers for the AI
enum DifficultyLevel: CustomStringConvertible {
    
    case easy, medium, hard
    
    var description: String {
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
            return 1 / 3
        case .medium:
            return 1 / 4
        case .hard:
            return 0
        }
    }
}
