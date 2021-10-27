//
//  PositionView.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

///A view representing one position on the board. Also contains code to display an alert upon game completion.
///- Author: Matt Geimer
///- Version: 1.0
struct PositionView: View {
    
    @EnvironmentObject var gameState: GameState
    var position: Position
    var positionValue: PositionValue
    @State private var presentAlert: Bool = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    
    var size: CGSize
    
    var body: some View {
        Button(action: {
            Task(priority: .userInitiated) {
                let inputResult = await self.gameState.makeMove(position: self.position)
                await MainActor.run(body: {
                    //Attempt to play the position, if the position cannot be played, set variable to show alert
                    if inputResult == .occupied {
                        self.alertTitle = "Move Invalid"
                        self.alertMessage = "A player has already used this position"
                        self.presentAlert = true
                    } else if inputResult == .notPlayerTurn {
                        self.alertTitle = "Not your turn"
                        self.alertMessage = "The AI is currently attempting to make its move"
                        self.presentAlert = true
                    } else if self.gameState.gamePhase == .xWins {
                        self.alertTitle = "X wins!"
                        self.alertMessage = "Player X has won!"
                        self.presentAlert = true
                    } else if self.gameState.gamePhase == .oWins {
                        self.alertTitle = "O wins!"
                        self.alertMessage = "Player O has won!"
                        self.presentAlert = true
                    } else if self.gameState.gamePhase == .tie {
                        self.alertTitle = "Tie Game"
                        self.alertMessage = "No player has won"
                        self.presentAlert = true
                    }
                })
            }
        }) {
            Text(positionValue.description)
                .font(.system(size: UIDevice.current.userInterfaceIdiom == .phone ? 64 : 128))
                .foregroundColor(positionValue.color)
                .frame(width: size.width, height: size.height)
                .background(Color("positionBackground"))
                .cornerRadius(size.width / 2)
                
        }
        .alert(isPresented: $presentAlert) {
            Alert(title: Text(self.alertTitle), message: Text(self.alertMessage)) //Present an alert if the user attempts to play an already taken position
        }
    }
}

struct PositionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PositionView(position: .topLeft, positionValue: .x, size: CGSize(width: 125, height: 125))
                .previewLayout(.fixed(width: 150, height: 150))
            PositionView(position: .topLeft, positionValue: .o, size: CGSize(width: 125, height: 125))
                .previewLayout(.fixed(width: 150, height: 150))
            PositionView(position: .topLeft, positionValue: .empty, size: CGSize(width: 125, height: 125))
                .previewLayout(.fixed(width: 150, height: 150))
        }
            .environmentObject(GameState(singlePlayer: false, difficulty: .easy))
            .environment(\.colorScheme, .dark)
    }
}
