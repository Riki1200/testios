//
//  ContentView.swift
//  testApp
//
//  Created by Romeo Betances on 1/9/22.
//

import SwiftUI

struct MainScreenNavigation: View {
    
    @State var child = false
    @StateObject var movieViewModel = MovieViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Choose your interested")
                    .fontWeight(.bold)
                    .font(.title)
                NavigationLink(destination: MovieScreen().environmentObject(movieViewModel)) {
                    Text("Watch movie")
                        .padding()
                        .frame(width: 150, height: 50, alignment: Alignment.center)
                        .background(.blue)
                        .foregroundColor(.white)
                }
                NavigationLink(destination: GameScreen(isChild: $child).navigationBarHidden(true)) {
                    Text("Fun Games").padding()
                        .frame(width: 150, height: 50, alignment: Alignment.center)
                        .background(.blue)
                        .foregroundColor(.white)
                        .onSubmit {
                            self.child = true
                        }
                }.onSubmit {
                    self.child = true
                }
                
              

                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenNavigation()
    }
}
