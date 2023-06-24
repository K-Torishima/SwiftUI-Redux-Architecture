//
//  MoviesAppStore.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import Foundation

typealias MoviesAppDispatcher = (MoviesAppAction) -> Void

typealias MoviesAppReducer<State: MoviesReduxState> = (_ state: State, _ action: MoviesAppAction) -> State
typealias MoviesAppMiddleware<StoreState: MoviesReduxState> = (StoreState, MoviesAppAction, @escaping MoviesAppDispatcher) -> Void

class MoviesAppStore<StoreState: MoviesReduxState>: ObservableObject {
    
    var reducer: MoviesAppReducer<StoreState>
    @Published var state: StoreState
    var middlewares: [MoviesAppMiddleware<StoreState>]
    
    init(
        reducer: @escaping MoviesAppReducer<StoreState>,
        state: StoreState,
        middlewares: [MoviesAppMiddleware<StoreState>] = []
    ) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    func dispatch(action: MoviesAppAction) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
