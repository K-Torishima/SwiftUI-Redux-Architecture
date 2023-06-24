//
//  CounterState.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/18.
//

import Foundation

protocol ReduxState {}

struct AppState: ReduxState {
    var counterState = CounterState()
    var taskState = TaskState()
}

struct TaskState: ReduxState {
    var tasks: [Todo] = []
}

struct CounterState: ReduxState {
    var counter: Int = 0
}
