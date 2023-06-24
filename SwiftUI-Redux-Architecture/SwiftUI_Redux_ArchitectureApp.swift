//
//  SwiftUI_Redux_ArchitectureApp.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/18.
//

import SwiftUI

@main
struct SwiftUI_Redux_ArchitectureApp: App {
    
    let store = Store(
        reducer: appReducer,
        state: AppState(),
        middlewares: [
            logMiddleware(),
            incrementMiddleware()
        ]
    )
    
    let moviesAppStore = MoviesAppStore(
        reducer: moviesAppResucer,
        state: MoviesAppState(),
        middlewares: [
            moviesMiddleware()
        ]
    )
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .environmentObject(store)
                    .tabItem {
                        Text("counterApp")
                    }
                
                MoviesAppView()
                    .environmentObject(moviesAppStore)
                    .tabItem {
                        Text("MoviesAppView")
                    }
            }
        }
    }
}
