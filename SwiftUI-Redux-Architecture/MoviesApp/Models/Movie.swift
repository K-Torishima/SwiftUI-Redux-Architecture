//
//  Movie.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.
//

import Foundation

// データがあると仮定する

struct MovieResponse: Decodable {
    let movies: [Movie]
}

struct Movie: Decodable {
    let id: String
    let title: String
}
