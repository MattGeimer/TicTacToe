//
//  CreditView.swift
//  EZ Tic Tac Toe
//
//  Created by Matthew Geimer on 8/22/20.
//  Copyright © 2020 Matthew Geimer. All rights reserved.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack {
            Text("Development Team")
                .font(.title)
                .padding(.top)
            PersonView(name: "Matt Geimer", role: "Developer", imagePath: "mattGeimer")
            PersonView(name: "Bill Yen", role: "Artist", imagePath: "billYen")
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], content: {
                VStack {
                    Text("Beta Testers")
                        .font(.title)
                    Text("Sam Pomerantz")
                    Text("Ben Newcomb")
                    Text("Tyler Janczak")
                }
                VStack {
                    Text("Additional Help")
                        .font(.title)
                    Text("Michael M. Mayer")
                    Spacer()
                }
            })
        }
            .navigationBarTitle("Credits", displayMode: .inline)
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
