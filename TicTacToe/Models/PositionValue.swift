//
//  PositionValue.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

//An enum representing the value of a current position, and what color/text a PositionView should display based on that value
enum PositionValue {
	case empty, x, o
	
	var stringRepresentation: String {
		switch self {
			case .empty: return " "
			case .x: return "X"
			case .o: return "O"
		}
	}
	
	var colorToDisplay: Color {
		switch self {
			case .x: return Color.red
			case .o: return Color.blue
			case .empty: return Color.yellow
		}
	}
}
