//
//  MoviesAppView.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import SwiftUI

struct MoviesAppView: View {
    
    @EnvironmentObject var store: MoviesAppStore<MoviesAppState>
    @State private var search: String = ""
    
    struct Props {
        let movies: [Movie]
        let onSearch: (String) -> Void
    }
    
    private func map(state: MoviesState) -> Props {
        Props(
            movies: state.movies,
            onSearch: { keyword in
                store.dispatch(action: FetchMovies(search: keyword))
            }
        )
    }
    
    var body: some View {
        
        let props = map(state: store.state.moviesSate)
        
        NavigationStack {
            VStack {
                
                TextField("Search", text: $search)
                    .onSubmit { props.onSearch(search) }
                    .textFieldStyle(.roundedBorder)
                List(props.movies, id: \.id) { movie in
                    Text(movie.title)
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
