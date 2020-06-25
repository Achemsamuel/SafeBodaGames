//
//  OnboardinInitializeThirdPartyCommandsgSlide.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//


import Foundation
import UIKit
import IQKeyboardManagerSwift



struct InitializeThirdPartyCommands: Command {

    func execute() {
        // Third parties are initialized here
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside =  true
    }

}
