//
//  TitleLabelView.swift
//  TicTacToe
//
//  Created by Matthew Geimer on 2/3/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

///A View containing a stylized label
///- Author: Matt Geimer
///- Version: 1.0
struct TitleLabelView: View {
	
	var labelText: String
	
	var body: some View {
		Text(labelText)
			.font(.largeTitle)
			.foregroundColor(Color("backgroundColor"))
			.frame(minWidth: 200)
			.padding()
			.background(Color("positionBackground"))
			.cornerRadius(50)
	}
}

struct TitleLabel_Previews: PreviewProvider {
    static var previews: some View {
        TitleLabelView(labelText: "Test label")
			.previewLayout(.fixed(width: 300, height: 100))
    }
}
