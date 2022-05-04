//
//  Alerts.swift
//  LemmingBattle
//
//  Created by Stepan Potapov on 05.05.2022.
//

import Foundation
import UIKit

extension UIAlertController{
    
    static func createAlert(withTitle title: String,
                            message: String,
                            cancelActionTitle: String? = nil) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: cancelActionTitle ?? "Ok", style: .cancel)
        alert.addAction(alertAction)
        return alert
    }
}
