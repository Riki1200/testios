//
//  MovieScreenViewModel.swift
//  testApp
//
//  Created by Romeo Betances on 2/9/22.
//

import Foundation
import SwiftUI

final class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private var movieRepository = MovieRepository<Result<Movie>>()

    func getMovies() {
        movieRepository.getMovies() { (result) in
            if result.results.count > 0 {
                self.movies = result.results
              
            }
        }
      

        
    }
}
