//
//  Positions.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import Foundation

///Represents where on the board a position is
///- Author: Matt Geimer
///- Version: 1.0
enum Position {
	case topLeft, topMiddle, topRight
	case middleLeft, center, middleRight
	case bottomLeft, bottomMiddle, bottomRight
	
	///Returns coordinate in form (x,y), where x and y begin in the top left corner at (0,0) and increase as x and y approach the bottom right
	///- Author: Matt Geimer
	///- Version: 1.0
	var coordinate: (Int, Int) {
		switch self {
			case .topLeft: return (0,0)
			case .topMiddle: return (1,0)
			case .topRight: return (2,0)
			case .middleLeft: return (0,1)
			case .center: return (1,1)
			case .middleRight: return (2,1)
			case .bottomLeft: return (0,2)
			case .bottomMiddle: return (1,2)
			case .bottomRight: return (2,2)
		}
	}
	
	///Returns the string representation of the position's name
	///- Author: Matt Geimer
	///- Version: 1.0
	var stringRepresentation: String {
		switch self {
			case .topLeft: return "topLeft"
			case .topMiddle: return "topMiddle"
			case .topRight: return "topRight"
			case .middleLeft: return "middleLeft"
			case .center: return "center"
			case .middleRight: return "middleRight"
			case .bottomLeft: return "bottomLeft"
			case .bottomMiddle: return "bottomMiddle"
			case .bottomRight: return "bottomRight"
		}
	}
}
