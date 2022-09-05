//
//  MovieDetail.swift
//  testApp
//
//  Created by Romeo Betances on 5/9/22.
//

import SwiftUI

struct MovieDetail: View {
    
    @StateObject var viewModel: DependencyViewModel
    var item: Movie
    
    var body: some View {
        Text("\(viewModel.movieItem.title)")
        
        Text("\(item.title)")
    }
}


extension MovieDetail {
    
    class DependencyViewModel : ObservableObject {
        @Published var movieItem: Movie = Movie()
        
        func getMovie(movieItem: Movie){
            self.movieItem = movieItem
        }
    }
    
}

struct MovieDetail_Previews: PreviewProvider {
    @StateObject static var viewModel: MovieDetail.DependencyViewModel = MovieDetail.DependencyViewModel()
    static var previews: some View {
        MovieDetail(viewModel: viewModel, item: viewModel.movieItem)
    }
}
