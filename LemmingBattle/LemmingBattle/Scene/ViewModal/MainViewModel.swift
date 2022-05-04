//
//  MainViewModal.swift
//  LemmingBattle
//
//  Created by Stepan Potapov on 03.05.2022.
//

import Foundation

final class MainViewModel{
    
    private var model: BattleInfo!
    
    var DidFightIsOver: ((String) -> Void)?
    var DidFindError: ((String) -> Void)?
    
    init(model: BattleInfo){
        self.model = model
    }
    
    func letsFight(countOfBattlefields: String?, greenArmy: String?, blueArmy: String?){
        
        var errorMessage = ""
        
        guard let countOfBattlefields = countOfBattlefields else {
            return
        }
        
        guard let greenArmy = greenArmy else {
            return
        }
        
        guard let blueArmy = blueArmy else {
            return
        }
        
        if !validationInputString(str: countOfBattlefields){
            errorMessage += "Сount of battlefields must contain a number or numbers separated by a space"
        }
        
        if !validationInputString(str: greenArmy){
            if errorMessage.isEmpty{
                errorMessage += "Green army must contain a number or numbers separated by a space"
            }
            else{
                errorMessage = "Green army, \(errorMessage)"
            }
        }
        
        if !validationInputString(str: blueArmy){
            if errorMessage.isEmpty{
                errorMessage += "Blue army must contain a number or numbers separated by a space"
            }
            else{
                errorMessage = "Blue army, \(errorMessage)"
            }
        }
        
        guard errorMessage.isEmpty else{
            DidFindError?(errorMessage)
            return
        }
        
        let countModel = Int(countOfBattlefields) ?? 1
        let greenArmyModel = greenArmy.components(separatedBy:" ").map{Int($0) ?? 0}
        let blueArmyModel = blueArmy.components(separatedBy:" ").map{Int($0) ?? 0}
        
       
        DidFightIsOver?(model.fight(countOfBattlefields: countModel, greenArmy: greenArmyModel, blueArmy: blueArmyModel))
    }
    
    private func validationInputString(str: String) -> Bool{
        return !str.isEmpty && str.rangeOfCharacter(from: .decimalDigits.union(.whitespaces).inverted) == nil
    }
    

    
    
    
    
    
}
