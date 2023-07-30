//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by ray on 7/29/23.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView().navigationBarHidden(true)
                
            }.environmentObject(vm)
        }
    }
}
