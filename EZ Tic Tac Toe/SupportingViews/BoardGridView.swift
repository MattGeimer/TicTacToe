//
//  BoardGridView.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

///A view containing the entire board
///- Author: Matt Geimer
///- Version: 1.0
struct BoardGridView: View {
	
	@EnvironmentObject var gameState: GameState
	var positions: [[Position]]
	
	var body: some View {
		GeometryReader { geometry in
			VStack {
				ForEach(self.positions, id: \.self) { row in
					HStack {
						ForEach(row, id: \.self) { position in
							PositionView(position: position, positionValue: self.gameState.positionValues[position.coordinate.1][position.coordinate.0], size: CGSize(width: geometry.size.width > geometry.size.height ? geometry.size.height / 4 : geometry.size.width / 4, height: geometry.size.width > geometry.size.height ? geometry.size.height / 4 : geometry.size.width / 4))
									.padding(geometry.size.width / 32)
									.environmentObject(self.gameState)
                                    .accessibility(identifier: position.description)
						}
					}
				}
			}
		}
	}
}

struct BoardGrid_Previews: PreviewProvider {
    static var previews: some View {
        BoardGridView(positions: [[.topLeft, .topMiddle, .topRight], [.middleLeft, .center, .middleRight], [.bottomLeft, .bottomMiddle, .bottomRight]])
			.environmentObject(GameState(singlePlayer: false, difficulty: .easy))
			.previewLayout(.fixed(width: 450, height: 450))
    }
}
