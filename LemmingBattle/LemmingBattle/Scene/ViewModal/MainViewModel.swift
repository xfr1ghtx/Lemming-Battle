//
//  MainViewModal.swift
//  LemmingBattle
//
//  Created by Stepan Potapov on 03.05.2022.
//

import Foundation

final class MainViewModel{
    
    private var model: BattleInfo!
    
    var DidFightResult: ((String) -> Void)?
    var FindError: ((String) -> Void)?
    
    init(model: BattleInfo){
        self.model = model
    }
    
    func letsFight(countOfBattlefields: String?, greenArmy: String?, blueArmy: String?){
        
        guard let countOfBattlefields = countOfBattlefields else {
            FindError?("Incorrent count of battlefields")
            return
        }
        
        guard let greenArmy = greenArmy else {
            FindError?("Incorrent green army")
            return
        }
        
        guard let blueArmy = blueArmy else {
            FindError?("Incorrent blue army")
            return
        }
        
        let countModel = Int(countOfBattlefields) ?? 1
        
        let greenArmyModel = greenArmy.components(separatedBy:" ").map{Int($0) ?? 0}
        
        let blueArmyModel = blueArmy.components(separatedBy:" ").map{Int($0) ?? 0}
        
       
        
        DidFightResult?(model.fight(countOfBattlefields: countModel, greenArmy: greenArmyModel, blueArmy: blueArmyModel))

        
        
    }
    

    
    
    
    
    
}
