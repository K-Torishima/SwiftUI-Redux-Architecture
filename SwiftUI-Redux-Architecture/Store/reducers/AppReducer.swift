//
//  AppReducer.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/18.
//

import Foundation

func appReducer(_ state: AppState, action: Action) -> AppState {
    
    var state = state
    
    state.counterState = counterReducer(state.counterState, action)
    state.taskState = taskReducer(state.taskState, action)
    
    return state
}
