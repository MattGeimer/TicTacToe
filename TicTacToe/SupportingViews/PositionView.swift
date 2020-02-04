//
//  PositionView.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

struct PositionView: View {
	
	@EnvironmentObject var globalEnvironment: GlobalEnvironment
	var position: Position
	var positionValue: PositionValue
	@State private var showingAlert: Bool = false
	
    var body: some View {
		Button(action: {
			//Attempt to play the position, if the position cannot be played, set variable to show alert
			if self.globalEnvironment.receiveInput(position: self.position) == false {
				self.showingAlert = true
			}
		}) {
			Text(positionValue.stringRepresentation)
				.font(.system(size: 64))
				.foregroundColor(positionValue.colorToDisplay)
				.frame(width: 125, height: 125)
				.background(Color.black)
				.cornerRadius(62.5)
				
		}
		.alert(isPresented: $showingAlert) {
			Alert(title: Text("Move Invalid"), message: Text("A player has already used this position"), dismissButton: .cancel()) //Present an alert if the user attempts to play an already taken position
        }
    }
}

struct PositionView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			PositionView(position: .topLeft, positionValue: .x)
				.previewLayout(.fixed(width: 150, height: 150))
			PositionView(position: .topLeft, positionValue: .o)
				.previewLayout(.fixed(width: 150, height: 150))
			PositionView(position: .topLeft, positionValue: .empty)
				.previewLayout(.fixed(width: 150, height: 150))
		}
			.environmentObject(GlobalEnvironment())
    }
}
