//
//  Webservice.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/24.

import Foundation

class Webservice {
    let mockData = """
                     {
                         "movies": [
                             {
                                 "id": "1",
                                 "title": "映画1"
                             },
                             {
                                 "id": "2",
                                 "title": "映画2"
                             },
                             {
                                 "id": "3",
                                 "title": "映画3"
                             },
                             {
                                 "id": "4",
                                 "title": "映画4"
                             },
                             {
                                 "id": "5",
                                 "title": "映画5"
                             }
                         ]
                     }
                  """.data(using: .utf8)
    
    let mockDetailData = """
                         {
                            "title": "映画の詳細",
                            "text": "これは詳細です"
                         }
                  """.data(using: .utf8)
    
    func getMoviesBy(search: String) async throws -> [Movie] {
        do {
            let response = try JSONDecoder().decode(MovieResponse.self, from: mockData!)
            return response.movies
        } catch {
            throw error
        }
    }
    
    func getMoviesDetal(id: String) async throws -> MovieDetail {
        do {
            let response = try JSONDecoder().decode(MovieDetail.self, from: mockDetailData!)
            return response
        } catch {
            throw error
        }
    }
}

