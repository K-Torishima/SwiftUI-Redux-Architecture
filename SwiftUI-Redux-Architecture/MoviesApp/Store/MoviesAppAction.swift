//
//  MoviesAppAction.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import Foundation

protocol MoviesAppAction {}

struct FetchMovies: MoviesAppAction {
    let search: String
}

struct SetMovies: MoviesAppAction {
    let movies: [Movie]
}
