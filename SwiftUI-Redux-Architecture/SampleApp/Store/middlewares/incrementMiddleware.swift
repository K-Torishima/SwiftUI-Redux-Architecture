//
//  incrementMiddleware.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import Foundation

func incrementMiddleware() -> Middleware<AppState> {
    
    return { state, action, dispatch in
        switch action {
        case _ as IncrementActionAsync:
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                dispatch(IncrementAction())
            }
            
            
        
            
            
        
        default:
            break
        }
    }
}

