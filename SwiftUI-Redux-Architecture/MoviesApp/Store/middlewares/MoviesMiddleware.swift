//
//  MoviesMiddleware.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import Foundation

// 処理が単調なら機能ごとにMiddleWareを実装してもいいけどどうなんだろう
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
        case let action as FetchMovieDetail:
            Task {
                do {
                    try await Task.sleep(nanoseconds: NSEC_PER_SEC * 1)
                    let detail = try await Webservice().getMoviesDetal(id: action.id)
                    dispatch(SetMovieDetail(detail: detail))
                } catch {
                    print(error.localizedDescription)
                }
            }
        default:
            break
        }
    }
}
