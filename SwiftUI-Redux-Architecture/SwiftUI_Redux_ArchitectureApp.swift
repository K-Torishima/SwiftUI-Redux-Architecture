//
//  SwiftUI_Redux_ArchitectureApp.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/18.
//

import SwiftUI

@main
struct SwiftUI_Redux_ArchitectureApp: App {
    
    let store = Store(reducer: appReducer, state: AppState())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
