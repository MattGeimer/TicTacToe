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
					Group {
						NavigationLink(destination: SingleplayerView().environmentObject(GameState(singlePlayer: true))) {
							TitleLabelView(labelText: "Singleplayer")
								.accessibility(label: Text("singleplayer"))
						}
						NavigationLink(destination: MultiplayerView()
							.environmentObject(GameState(singlePlayer: false))) {
							TitleLabelView(labelText: "Multiplayer")
								.accessibility(label: Text("multiplayer"))
						}
					}
						.padding(25)
				}
					.navigationBarTitle("Tic Tac Toe")
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ForEach(["iPhone SE", "iPhone 11 Pro", "iPhone 11 Pro Max", "iPad Pro (11-inch)"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
