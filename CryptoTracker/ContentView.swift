//
//  ContentView.swift
//  CryptoTracker
//
//  Created by ray on 7/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                
                Text("Accent Color").foregroundColor(Color.theme.accent)
                
                Text("Secondary Color").foregroundColor(Color.theme.secondaryText)
                
                Text("Red Color").foregroundColor(Color.theme.red)
                
                Text("Green Color").foregroundColor(Color.theme.green)
                
                
                
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
