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

// actionを定義
struct AddTaskAction: Action {
    // そのアクションで振る舞うデータを定義
    let task: Todo
}

struct AddAction: Action {
    let value: Int
}


// Async
struct IncrementActionAsync: Action {}
