//
//  MoviesMiddleware.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import Foundation

func moviesMiddleware() -> MoviesAppMiddleware<MoviesAppState> {
    
    return { state, action, dispatch in
        switch action {
        case let action as FetchMovies:
            Task {
                do {
                    try await Task.sleep(nanoseconds: NSEC_PER_SEC * 1)
                    let movies = try await Webservice().getMoviesBy(search: action.search)
                    dispatch(SetMovies(movies: movies))
                } catch {
                    print(error.localizedDescription)
                }
            }
        default:
            break
        }
    }
}
