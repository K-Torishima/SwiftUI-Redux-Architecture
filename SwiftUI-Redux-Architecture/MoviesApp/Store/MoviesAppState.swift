//
//  MoviesReduxState.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import Foundation

protocol MoviesReduxState {}

struct MoviesAppState: MoviesReduxState {
    var moviesSate = MoviesState()
}

struct MoviesState: MoviesReduxState {
    var movies = [Movie]()
    var selectedMovieDetail: MovieDetail?
    
}
