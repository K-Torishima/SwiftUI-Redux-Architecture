//
//  LogMiddleware.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import Foundation

func logMiddleware() -> Middleware<AppState> {
    
    return { state, action, dispatch in
        print("Log middleware")
        
    }
}
