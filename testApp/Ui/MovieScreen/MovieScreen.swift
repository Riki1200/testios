//
//  MovieScreen.swift
//  testApp
//
//  Created by Romeo Betances on 1/9/22.
//

import SwiftUI

struct MovieScreen: View {
    @EnvironmentObject var injectedModel: MovieViewModel

    @StateObject var movieDetailViewModel = MovieDetail.DependencyViewModel()

    @State var isSelected = false
    @State var movieItem: Movie = Movie()
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                Text("T")
                    .font(.title)
                    .padding(.top, -30)
                    .onAppear {
                        injectedModel.getMovies()
                    }.hidden()

                VStack {
                    ForEach(injectedModel.movies, id: \.id) { movie in
                        var t = false
                        HStack {
                            Button(action: {
                                print(movie.id)
                            }) {
                                NavigationLink(destination: {
                                    MovieDetail(viewModel: movieDetailViewModel, item: movie).environmentObject(movieDetailViewModel)

                                }) {
                                    HStack {
                                        VStack {
                                            Text("\(movie.title)\n")
                                                .font(.caption)
                                                .foregroundColor(.black)
                                                .lineLimit(2)
                                            Spacer()

                                            Text("\(movie.release_date)")
                                                .font(.caption)
                                                .foregroundColor(.blue)

                                        }.frame(alignment: Alignment.leading)

                                    }.font(.body)
                                }
                            }

                            Spacer()

                            VStack {
                                Button(action: {
                                    t.toggle()

                                    print("\(movie.id)")

                                    isSelected = t

                                    movieDetailViewModel.movieItem = movie
                                    movieDetailViewModel.getMovie(movieItem: movie)

                                }) {
                                    Label("", systemImage: t ? "star.fill" : "star")
                                }
                                .alert(isPresented: $isSelected) {
                                    Alert(title: Text("Added to favorities"),
                                          message: Text("You have been alerted.\nThank you"),
                                          dismissButton: .default(Text("OK"))
                                    )
                                }

                                let rounded = Double(movie.vote_average).formatted()
                                Text("Rate \(rounded) / 10").font(.footnote)
                                    .fontWeight(.light)
                            }.layoutPriority(20)
                        }

                        Divider()
                    }.navigationTitle(Text("Top movies 2015-2022")
                        .font(.headline).fontWeight(.light))
                        .navigationBarItems(
                            trailing:
                            NavigationLink(destination: MovieFavorite()) {
                                Text("Favoritos")
                            }
                        )

                }.padding()
            }
        }.navigationBarHidden(true)
    }
}

struct MovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreen()
    }
}
