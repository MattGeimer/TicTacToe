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
enum Position: String, CustomStringConvertible {
    var description: String {
        return rawValue
    }
    
    case topLeft, topMiddle, topRight
    case middleLeft, center, middleRight
    case bottomLeft, bottomMiddle, bottomRight
    
    ///Returns coordinate in form (x,y), where x and y begin in the top left corner at (0,0) and increase as x and y approach the bottom right
    ///- Version: 1.0
    var coordinate: (col: Int, row: Int) {
        switch self {
            // Top row
            case .topLeft:      return (0,0)
            case .topMiddle:    return (1,0)
            case .topRight:     return (2,0)
            // Middle row
            case .middleLeft:   return (0,1)
            case .center:       return (1,1)
            case .middleRight:  return (2,1)
            // Bottom row
            case .bottomLeft:   return (0,2)
            case .bottomMiddle: return (1,2)
            case .bottomRight:  return (2,2)
        }
    }
        
    static func getCoordinate(x: Int, y: Int) -> Position {
        switch x {
        case 0:
            switch y {
            case 0:
                return .topLeft
            case 1:
                return .middleLeft
            default:
                return .bottomLeft
            }
        case 1:
            switch y {
            case 0:
                return .topMiddle
            case 1:
                return .center
            default:
                return .bottomMiddle
            }
        case 2:
            switch y {
            case 0:
                return .topRight
            case 1:
                return .middleRight
            default:
                return .bottomRight
            }
        default:
            return .center
        }
    }
    
}
