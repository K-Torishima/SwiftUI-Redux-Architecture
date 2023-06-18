//
//  CounterStore.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/18.
//

import Foundation

typealias Reducer = (_ state: CounterState, _ action: CounterAction) -> CounterState

class CounterStore: ObservableObject {
    
    var reducer: Reducer
    @Published var state: CounterState
    
    init(reducer: @escaping Reducer, state: CounterState = CounterState()) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: CounterAction) {
        state = reducer(state, action)
    }
}
