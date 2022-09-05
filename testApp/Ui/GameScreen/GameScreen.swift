//
//  GameScreen.swift
//  testApp
//
//  Created by Romeo Betances on 1/9/22.
//

import SwiftUI

struct GameScreen: View {
    @Binding var isChild: Bool
    @State var randomGame: RandomGames = RandomGames(gameName: "")
    let games = GamesMockData()

    var body: some View {
        
        
        NavigationView {
            List(games.games) { v in

                VStack {
                    NavigationLink(v.gameName, destination: GamesItem(key: $randomGame).onAppear {
                        randomGame = v
                    })
                }
                .padding()
                
                
            }.navigationTitle("Fun Games")
                
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    @State static var s = false
    static var previews: some View {
        GameScreen(isChild: $s)
    }
}
