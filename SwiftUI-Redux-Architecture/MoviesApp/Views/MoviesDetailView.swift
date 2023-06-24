//
//  MoviesDetailView.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import SwiftUI

struct MoviesDetailView: View {
    
    @EnvironmentObject var store: MoviesAppStore<MoviesAppState>
    
    let movie: Movie
    
    struct Props {
        let detail: MovieDetail?
        let onLoadMovieDetail: (String) -> Void
    }
    
    private func map(state: MoviesState) -> Props {
        Props(detail: state.selectedMovieDetail,
              onLoadMovieDetail: { id in
            store.dispatch(action: FetchMovieDetail(id: id))
        })
    }
    
    var body: some View {
        let props = map(state: store.state.moviesSate)
        
        VStack {
            Group {
                if let detail = props.detail {
                    VStack {
                        Text(detail.title)
                        Text(detail.text)
                    }
                } else {
                    Text("Loding")
                }
            }
        }
        .onAppear {
            props.onLoadMovieDetail(movie.id)
        }
    }
}

struct MoviesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesDetailView(movie: Movie(id: "1", title: "テストタイトル"))
    }
}
