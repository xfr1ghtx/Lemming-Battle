//
//  ResultOfBattle.swift
//  LemmingBattle
//
//  Created by Stepan Potapov on 03.05.2022.
//

import Foundation

enum ResultOfBattle{
    case draw, greenWin(fighters: [Int]), blueWin(fighters: [Int])
 
    var title: String{
        switch self{
            case .draw:
                return "Green and Blue died"
            case .greenWin (let fighters):
            return "Green wins: \(fighters.map { String($0) }.joined(separator: " "))"
            case .blueWin (let fighters):
                return "Blue wins: \(fighters.map { String($0) }.joined(separator: " "))"
        }
    }
}
