//
//  MultiplayerView.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 4/6/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameState: GameState
	let positions: [[Position]] = [[.topLeft, .topMiddle, .topRight], [.middleLeft, .center, .middleRight], [.bottomLeft, .bottomMiddle, .bottomRight]]
	
	let boardAdjustmentConstant: CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 1 : 6/8
	
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
                .frame(height: UIScreen.main.bounds.size.height / 5, alignment: .center)
            TitleLabelView(labelText: self.gameState.singlePlayer ? "Single Player" : "Multiplayer")
                .padding()
                .frame(width: UIScreen.main.bounds.size.width / (4/3), height: UIScreen.main.bounds.size.height / 10)
                .accessibility(identifier: "titleLabel")
            
            BoardGridView(positions: self.positions)
            .frame(width: UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height ? UIScreen.main.bounds.size.width * self.boardAdjustmentConstant : UIScreen.main.bounds.size.height * self.boardAdjustmentConstant, height: UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height ? UIScreen.main.bounds.size.width * self.boardAdjustmentConstant : UIScreen.main.bounds.size.height * self.boardAdjustmentConstant)
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
            
            if !gameState.xPlayerTurn && gameState.singlePlayer {
                ProgressView("AI Thinking", value: gameState.aiSolutionProgress, total: 1)
                    .animation(.easeInOut)
            }
            
            Spacer()
        }
            .background(Color("backgroundColor"))
            .edgesIgnoringSafeArea(.all)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone 11 Pro", "iPhone 11 Pro Max", "iPad Pro (11-inch) (2nd generation)"], id: \.self) { deviceName in
            GameView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
		.environmentObject(GameState(singlePlayer: true, difficulty: .easy))
    }
}
