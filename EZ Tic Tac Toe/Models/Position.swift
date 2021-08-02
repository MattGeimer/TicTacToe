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
enum Position: String, CustomStringConvertible {  //3M: make code more Swift idiomatic by using CustomStringConvertible protocl when you need a string representation
    var description: String {
        return rawValue
    }
    
    case topLeft, topMiddle, topRight
    case middleLeft, center, middleRight
    case bottomLeft, bottomMiddle, bottomRight
    
    ///Returns coordinate in form (x,y), where x and y begin in the top left corner at (0,0) and increase as x and y approach the bottom right
    ///- Version: 1.0
    var coordinate: (col: Int, row: Int) {  //3M: makes sense here to add labels - easy to get confused otherwise
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
    
    // 3M: removed stringRepresentation since it wasn't necessary after using idiomatic Swift protocol: CustomStringConvertible
        
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
