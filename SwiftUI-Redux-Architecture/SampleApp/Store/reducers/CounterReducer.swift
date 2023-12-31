//
//  CounterReducer.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/18.
//

import Foundation

// reducer is to update the state
func counterReducer(_ state: CounterState, _ action: Action) -> CounterState {
    var state = state
    
    switch action {
    case _ as IncrementAction:
        state.counter += 1
    case _ as DecrementAction:
        state.counter -= 1
    case let action as AddAction:
        state.counter += action.value
    default:
        break
    }
    print(state)
    return state
}
