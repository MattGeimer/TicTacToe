//
//  DifficultyMenu.swift
//  EZ Tic Tac Toe
//
//  Created by Matthew Geimer on 5/25/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

struct DifficultyMenu: View {
	
	let difficultyLevels: [DifficultyLevel] = [.easy, .medium, .hard]
	
    var body: some View {
		VStack {
			ForEach(difficultyLevels, id: \.self) { difficulty in
				NavigationLink(destination: GameView().environmentObject(GameState(singlePlayer: true, difficulty: difficulty))) {
					TitleLabelView(labelText: difficulty.description)
				}
			}
				.padding()
		}
			.navigationBarTitle("Difficulty")
    }
}

struct DifficultyMenu_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyMenu()
    }
}
