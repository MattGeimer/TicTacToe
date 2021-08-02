//
//  DifficultyLevel.swift
//  EZ Tic Tac Toe
//
//  Created by Matthew Geimer on 5/25/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import Foundation

/// Represents different difficulty levers for the AI
enum DifficultyLevel: CustomStringConvertible {     //3M: More idiomatic Swift
    
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
            return 1 / 3    //3M: Let's be a bit more subtle - I am being subjective here
        case .medium:
            return 1 / 4    //3M:  Let's be a bit more subtle - I am being subjective here
        case .hard:
            return 0
        }
    }
}
