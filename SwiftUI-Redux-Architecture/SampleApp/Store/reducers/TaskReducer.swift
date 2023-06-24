//
//  TaskReducer.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/18.
//

import Foundation

func taskReducer(_ state: TaskState, _ action: Action) -> TaskState {
    var state = state
    
    switch action {
    case let action as AddTaskAction:
        state.tasks.append(action.task)
    default:
        break
    }
    
    return state
}
