//
//  MoviesAppReducer.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import Foundation

func moviesAppResucer(state: MoviesAppState, action: MoviesAppAction) -> MoviesAppState {
    
    
    var state = state
    state.moviesSate = moviesReducer(state.moviesSate, action: action)
    
    return state
}
