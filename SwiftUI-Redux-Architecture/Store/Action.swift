//
//  Action.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/18.
//

import Foundation

protocol Action {}

struct IncrementAction: Action {}
struct DecrementAction: Action {}

struct AddTaskAction: Action {
    let task: Task
}

struct AddAction: Action {
    let value: Int
}
