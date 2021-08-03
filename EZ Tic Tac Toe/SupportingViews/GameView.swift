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
        GeometryReader { geometry in
            VStack {
                Spacer()
                TitleLabelView(labelText: self.gameState.singlePlayer ? "Single Player" : "Multiplayer")
                    .padding()
                    .frame(width: geometry.size.width / (4/3), height: geometry.size.height / 10)
                    .accessibility(identifier: "titleLabel")
                    .colorMultiply(.blue)
                
                BoardGridView(positions: self.positions)
                .frame(width: geometry.size.width < geometry.size.height ? geometry.size.width * self.boardAdjustmentConstant : geometry.size.height * self.boardAdjustmentConstant, height: geometry.size.width < geometry.size.height ? geometry.size.width * self.boardAdjustmentConstant : geometry.size.height * self.boardAdjustmentConstant)
                .environmentObject(self.gameState)
                
                if self.gameState.gamePhase != .ongoing && self.gameState.gamePhase != .empty {
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
                .background(Color("backgroundColor"))
                .edgesIgnoringSafeArea(.all)
        }
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
