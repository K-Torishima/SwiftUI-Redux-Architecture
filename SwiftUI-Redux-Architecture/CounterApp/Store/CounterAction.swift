//
//  CounterAction.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/18.
//

import Foundation

protocol CounterAction {}

struct IncrementAction: CounterAction {}
struct DecrementAction: CounterAction {}

struct AddAction: CounterAction {
    let value: Int
}
