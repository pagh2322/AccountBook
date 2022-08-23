//
//  AccountBookApp.swift
//  AccountBook
//
//  Created by peo on 2022/08/21.
//

import SwiftUI

@main
struct AccountBookApp: App {
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(appState)
        }
    }
}
