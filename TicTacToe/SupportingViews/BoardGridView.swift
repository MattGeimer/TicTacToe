//
//  BoardGridView.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

struct BoardGridView: View {
	
	@EnvironmentObject var globalEnvironment: GlobalEnvironment
	var positions: [[Position]]
	
	var body: some View {
		VStack {
			ForEach(positions, id: \.self) { row in
				HStack {
					ForEach(row, id: \.self) { position in
						PositionView(position: position, positionValue: self.globalEnvironment.positionValues[position.coordinate.1][position.coordinate.0])
							.padding(5)
							.environmentObject(self.globalEnvironment).accessibility(identifier: position.stringRepresentation)
					}
				}
			}
		}
	}
}

struct BoardGrid_Previews: PreviewProvider {
    static var previews: some View {
        BoardGridView(positions: [[.topLeft, .topMiddle, .topRight], [.middleLeft, .center, .middleRight], [.bottomLeft, .bottomMiddle, .bottomRight]])
			.environmentObject(GlobalEnvironment())
    }
}
