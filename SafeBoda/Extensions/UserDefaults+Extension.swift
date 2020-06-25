//
//  UserDefaults+Extension.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/25/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation

extension UserDefaults {
    static let shared = UserDefaults()
     private enum UserDefaultsKeys: String {
        case firstTimeLaunch
    }
    
    var firstTimeLaunch: Int? {
           get {
            return integer(forKey: UserDefaultsKeys.firstTimeLaunch.rawValue)
           }
           set {
               set(newValue, forKey: UserDefaultsKeys.firstTimeLaunch.rawValue)
           }
       }
}

