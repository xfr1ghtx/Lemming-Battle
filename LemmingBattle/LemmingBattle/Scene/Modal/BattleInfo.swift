//
//  BattleInfo.swift
//  LemmingBattle
//
//  Created by Stepan Potapov on 03.05.2022.
//

import Foundation

struct BattleInfo{
    
    private var countOfBattlefields: Int
    private var greenArmy: [Int]
    private var blueArmy: [Int]
    
    init(countOfBattlefields count: Int, greenArmy: [Int], blueArmy: [Int]){
        countOfBattlefields = count
        self.greenArmy = greenArmy
        self.blueArmy = blueArmy
    }
    
    mutating func fight() -> String{
        
        var battlefields: [Battlefield] = []
        var count: Int
        
        while (!greenArmy.isEmpty && !blueArmy.isEmpty){
        
            
            count = countOfBattlefields < min(greenArmy.count, blueArmy.count) ? countOfBattlefields : min(greenArmy.count, blueArmy.count)
            
            for _ in 0..<count{
                
                let indexOfGreenFighter = greenArmy.firstIndex(of: greenArmy.max()!)
                let greenFighter = greenArmy.remove(at: indexOfGreenFighter!)
                
                let indexOfBlueFighter = blueArmy.firstIndex(of: blueArmy.max()!)
                let blueFighter = blueArmy.remove(at: indexOfBlueFighter!)
                
                battlefields.append(Battlefield.init(greenFighter: greenFighter, blueFighter: blueFighter))
            }
            
            for var battlefield in battlefields {
                battlefield.letsFight()
                
                if battlefield.blueFighter > 0 && battlefield.greenFighter == 0{
                    blueArmy.append(battlefield.blueFighter)
                }
                else if (battlefield.greenFighter > 0 && battlefield.blueFighter == 0){
                    greenArmy.append(battlefield.greenFighter)
                }
                else{
                    continue
                }
            }
            
            battlefields.removeAll()
        }
        
        if (greenArmy.isEmpty && !blueArmy.isEmpty){
            return ResultOfBattle.blueWin(fighters: blueArmy.sorted(by: >)).title
        }
        else if (blueArmy.isEmpty && !greenArmy.isEmpty){
            return ResultOfBattle.greenWin(fighters: greenArmy.sorted(by: >)).title
        }
        else{
            return ResultOfBattle.draw.title
        }
    }
}
