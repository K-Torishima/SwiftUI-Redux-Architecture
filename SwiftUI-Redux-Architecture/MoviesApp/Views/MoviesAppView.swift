//
//  MoviesAppView.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import SwiftUI


// 全体の流れはわかったけど、細かなところをどうするか気になる
// action定義の粒度　->
// ViewがPropsの分け方
// map関数に関して
struct MoviesAppView: View {
    
    @EnvironmentObject var store: MoviesAppStore<MoviesAppState>
    @State private var search: String = ""
    
    struct Props {
        let movies: [Movie]
        let onSearch: (String) -> Void
        let onDelete: () -> Void
    }
    
    // 画面のアクションもここに書くべきなのかな？
    private func map(state: MoviesState) -> Props {
        Props(
            movies: state.movies,
            onSearch: { keyword in
                store.dispatch(action: FetchMovies(search: keyword))
            },
            onDelete: {
                search = ""
            }
        )
    }
    
    var body: some View {
        
        let props = map(state: store.state.moviesSate)
        
        NavigationStack {
            VStack {
                TextField("Search", text: $search)
                    .onSubmit {
                        props.onSearch(search)
                        // view側の操作だからこれで良い？
                        props.onDelete()
                    }
                    .textFieldStyle(.roundedBorder)
                List(props.movies, id: \.id) { movie in
                    NavigationLink(movie.title) {
                        // Routingは別途考えると良さそう
                        MoviesDetailView(movie: movie)
                    }
                }
            }
            .navigationTitle("Movies")
        }
    }
}

struct MoviesAppView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = MoviesAppStore(
            reducer: moviesAppResucer,
            state: MoviesAppState(),
            middlewares: [moviesMiddleware()])
        
        MoviesAppView()
            .environmentObject(store)
    }
}
