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
		GeometryReader { geometry in
			VStack {
				Spacer()
				TitleLabelView(labelText: "Illini Tac Toe")
					.padding()
					.frame(width: geometry.size.width / (4/3), height: geometry.size.height / 10)
					.accessibility(identifier: "titleLabel")
				
				BoardGridView(positions: self.positions)
				.frame(width: geometry.size.width, height: geometry.size.width)
				.environmentObject(self.gameState)
				
				if self.gameState.gameState != .ongoing && self.gameState.gameState != .empty {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ForEach(["iPhone SE", "iPhone 11 Pro", "iPhone 11 Pro Max", "iPad Pro (11-inch)"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
			.environmentObject(GameState())
    }
}
