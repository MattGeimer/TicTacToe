//
//  PositionValue.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

///An enum representing the value of a current position, and what color/text a PositionView should display based on that value
///- Author: Matt Geimer
///- Version: 1.0
enum PositionValue: CustomStringConvertible {
    var description: String {
        switch self {
            case .empty: return " "
            case .x: return "✕"
            case .o: return "○"
        }
    }
    
    case empty, x, o

    ///Returns color which should be displayed when a position is a certain value
    ///- Version: 1.0
    var color: Color {
        switch self {
            case .x: return Color("xPlayerColor-new")
            case .o: return Color("oPlayerColor-new")
            case .empty: return Color.yellow
        }
    }
}
