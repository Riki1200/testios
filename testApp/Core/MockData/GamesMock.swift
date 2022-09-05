//
//  GamesMock.swift
//  testApp
//
//  Created by Romeo Betances on 2/9/22.
//

import Foundation

class GamesMockData {
    let games: [RandomGames]

    init() {
        games = [
            RandomGames(gameName: "Random Numbers", key: "RANDOM"),
            RandomGames(gameName: "Prime Numbers", key: "PRIME"),
            RandomGames(gameName: "Automatic ATM", key: "ATM"),
            RandomGames(gameName: "Coincidence Numbers", key: ""),
        ]
    }
}
