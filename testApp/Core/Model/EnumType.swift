//
//  EnumType.swift
//  testApp
//
//  Created by Romeo Betances on 2/9/22.
//

import Foundation

enum TypeGame: Identifiable {
    case RandomNumber(gameName: String)

    var id: String {
        switch self {
        case .RandomNumber(gameName: "RANDOM"): return "RANDOM"
        default:
            return ""
        }
    }
}
