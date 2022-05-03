//
//  MainViewModal.swift
//  LemmingBattle
//
//  Created by Stepan Potapov on 03.05.2022.
//

import Foundation

protocol MainViewModelDelegate{
    func fight(_ result: String)
}

final class MainViewModel{
    private var model: BattleInfo!
    
    var mainViewModelDelegate: MainViewModelDelegate?
    
    init(model: BattleInfo){
        self.model = model
    }
    
    func letsFight(countOfBattlefields: String?, greenArmy: String?, blueArmy: String?){
        
        guard let countOfBattlefields = countOfBattlefields else {
            mainViewModelDelegate?.fight("Incorrent count of battlefields")
            return
        }
        
        guard let greenArmy = greenArmy else {
            mainViewModelDelegate?.fight("Incorrent green army")
            return
        }
        
        guard let blueArmy = blueArmy else {
            mainViewModelDelegate?.fight("Incorrent blue army")
            return
        }
        
        let countModal = Int(countOfBattlefields)
        
        let greenArmyModal = greenArmy.compactMap{Int(String($0))}
        
        let blueArmyModal = blueArmy.compactMap{Int(String($0))}
        
        self.model = BattleInfo(countOfBattlefields: countModal!, greenArmy: greenArmyModal, blueArmy: blueArmyModal)
        
        mainViewModelDelegate?.fight(model.fight())

        
        
    }
    

    
    
    
    
    
}
