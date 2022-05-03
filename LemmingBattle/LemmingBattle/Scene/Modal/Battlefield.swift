//
//  Battlefield.swift
//  LemmingBattle
//
//  Created by Stepan Potapov on 03.05.2022.
//

import Foundation

struct Battlefield{
    var greenFighter: Int
    var blueFighter: Int
    
    init(greenFighter: Int, blueFighter: Int){
        self.blueFighter = blueFighter
        self.greenFighter = greenFighter
    }
 
    public mutating func letsFight(){
        if (greenFighter > blueFighter){
            greenFighter -= blueFighter
            blueFighter = 0
        }
        else if (blueFighter > greenFighter){
            blueFighter -= greenFighter
            greenFighter = 0
        }
        else{
            blueFighter = 0;
            greenFighter = 0;
        }
    }
}
