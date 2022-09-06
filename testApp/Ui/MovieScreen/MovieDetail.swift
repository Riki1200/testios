//
//  MovieDetail.swift
//  testApp
//
//  Created by Romeo Betances on 5/9/22.
//

import SDWebImageSwiftUI
import SwiftUI

struct MovieDetail: View {
    @StateObject var viewModel: DependencyViewModel

    let myPhotoUrl = URL(string: "https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg")!
    var item: Movie

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                WebImage(url: myPhotoUrl)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200)
                    .clipShape(Rectangle())
                    .padding(.top, -60)

                HStack {
                    Text("\(item.title)")
                    Spacer()
                    HStack {
                        
                        let rounded = Double(item.vote_average).formatted()
                        Text("Rate \(rounded) / 10").font(.footnote)
                            .fontWeight(.light)
                            .padding(.bottom, -5)
                        Button(action: {
                        }) {
                            Label("", systemImage: "star")
                        }
                       
                    }.padding(.bottom,5)
                }.padding()

                Spacer()

                Text("\(item.overview)")
                    .padding()

            }.padding()
        }
    }
}

extension MovieDetail {
    class DependencyViewModel: ObservableObject {
        @Published var movieItem: Movie = Movie()

        func getMovie(movieItem: Movie) {
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
