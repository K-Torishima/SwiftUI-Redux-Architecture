//
//  SwiftUI_Redux_ArchitectureApp.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/18.
//

import SwiftUI

@main
struct SwiftUI_Redux_ArchitectureApp: App {
    
    let store = CounterStore(reducer: reducer)
    
    var body: some Scene {
        WindowGroup {
            CounterAppScreen()
                .environmentObject(store)
        }
    }
}
