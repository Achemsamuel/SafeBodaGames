//
//  NavigationCommand.swift
//  Koya
//
//  Created by Achem Samuel on 4/22/20.
//  Copyright © 2020 Softcom Limited. All rights reserved.
//

import Foundation
import UIKit
import CDAlertView

struct AppDelegateNavigationCommand {
    let window: UIWindow
    
    
    /**
     This function handles the correct storyboard to instanciate based on the user currect onboarding step stage
     */
    func redirectToVerificationStep(storyboardname: String,  storybaordId: String) {
        let storyboard = UIStoryboard(name:storyboardname, bundle: nil)
        let verificationController = storyboard.instantiateViewController(withIdentifier: storybaordId)
        self.window.rootViewController = verificationController
    }
}
