//
//  ContentView.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@EnvironmentObject var gameState: GameState
	let positions: [[Position]] = [[.topLeft, .topMiddle, .topRight], [.middleLeft, .center, .middleRight], [.bottomLeft, .bottomMiddle, .bottomRight]]
	
    var body: some View {
		VStack {
			Spacer()
			TitleLabelView(labelText: "Illini Tac Toe")
				.padding(.bottom, 50)
				.accessibility(identifier: "titleLabel")
			
			BoardGridView(positions: positions)
				.environmentObject(gameState)
			if gameState.gameState != .ongoing && gameState.gameState != .empty {
				Button(action: {
					self.gameState.resetGame()
				}) {
					TitleLabelView(labelText: "New Game")
						.padding()
						.accessibility(identifier: "newGameButton")
				}
			}
			Spacer()
		}
			.background(Color.orange)
			.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(GameState())
    }
}
