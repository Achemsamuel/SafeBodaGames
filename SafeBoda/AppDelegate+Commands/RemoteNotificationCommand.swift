//
//  RegisterToRemoteNotificationsCommand.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation
import UIKit



struct RegisterToRemoteNotificationsCommand: Command {
    
    func execute() {
        registerForPushNotifications()
    }
    
    //MARK:- PUSH NOTIFICATIONS SETTINGS
       func registerForPushNotifications() {
           
       }
}
