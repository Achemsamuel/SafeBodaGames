//
//  RemoteNotificationCommand.swift
//  Koya
//
//  Created by Achem Samuel on 4/21/20.
//  Copyright © 2020 Softcom Limited. All rights reserved.
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
