//
//  GamesItem.swift
//  testApp
//
//  Created by Romeo Betances on 2/9/22.
//

import SwiftUI

struct GamesItem: View {
    @Binding var key: RandomGames

    var body: some View {
        
        
        switch key.key {
        case "RANDOM":
            NumbersRandomWidget()
        case "PRIME":
            PrimeNumberWidget()
        case "ATM":
            ATMWidget()
        default:
            Text("RENDER NOTHING")
        }
        
        Text(key.key)
    }
}

struct GamesItem_Previews: PreviewProvider {
    @State static var key: RandomGames = RandomGames(gameName: "")
    static var previews: some View {
        GamesItem(key: $key)
    }
}
