//
//  MoviesReducer.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import Foundation

func moviesReducer(_ state: MoviesState, action: MoviesAppAction) -> MoviesState {
    var state = state
    
    switch action {
    case let action as SetMovies:
        state.movies = action.movies
    default:
        break
    }
    return state
}
