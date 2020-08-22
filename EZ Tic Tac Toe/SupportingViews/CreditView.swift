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
        ZStack {
            LinearGradient(gradient: .init(colors: [.red, .blue]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Development Team")
                    .font(.title)
                PersonView(name: "Matt Geimer", role: "Developer", imagePath: "mattGeimer")
                PersonView(name: "Bill Yen", role: "Artist", imagePath: "billYen")
                VStack {
                    Text("Beta Testers")
                        .font(.title)
                    Text("Sam Pomerantz")
                    Text("Ben Newcomb")
                    Text("Tyler Janczak")
                }
            }
        }
            .navigationBarTitle("Credits", displayMode: .inline)
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreditView()
        }
    }
}
