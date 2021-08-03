//
//  PersonView.swift
//  EZ Tic Tac Toe
//
//  Created by Matthew Geimer on 8/22/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

struct PersonView: View {
    
    var name: String
    var role: String
    var imagePath: String
    
    var body: some View {
        VStack {
            Image(imagePath)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.gray, lineWidth: 5))
            HStack {
                Group {
                    Text(name)
                    Text("   •   ")
                    Text(role)
                }
                .font(.headline)
            }
        }
        .padding()
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(name: "Matt Geimer", role: "Developer", imagePath: "mattGeimer")
            .previewLayout(.fixed(width: 300, height: 250))
    }
}
