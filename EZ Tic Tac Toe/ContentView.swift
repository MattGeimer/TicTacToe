//
//  ContentView.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationView {
			ZStack {
				Color("backgroundColor")
					.edgesIgnoringSafeArea(.all)
				VStack {
					Text("EZ Tic Tac Toe")
						.font(.largeTitle)
						.fontWeight(.heavy)
					
					Spacer()
					
					Group {
						NavigationLink(destination: GameView().environmentObject(GameState(singlePlayer: true))) {
							TitleLabelView(labelText: "1 Player")
								.accessibility(label: Text("singleplayer"))
						}
						NavigationLink(destination: GameView()
							.environmentObject(GameState(singlePlayer: false))) {
							TitleLabelView(labelText: "2 Players")
								.accessibility(label: Text("multiplayer"))
						}
					}
						.padding(25)
					Spacer()
				}
			}
		}
		.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ForEach(["iPhone SE (2nd generation)", "iPhone 11 Pro", "iPhone 11 Pro Max", "iPad Pro (11-inch)", "iPad (7th generation)"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
