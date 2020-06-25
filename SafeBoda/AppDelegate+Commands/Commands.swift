//
//  InitialViewControllerCommand.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation
import UIKit

protocol Command {
    func execute()
}

struct InitialViewControllerCommand: Command {
    let window: UIWindow

    func execute() {
        checkFirstLanchState()
    }
    
    private func checkFirstLanchState() {
        if UserDefaults.shared.firstTimeLaunch == 0 {
            self.loadOnBoardViewController()
            UserDefaults.shared.firstTimeLaunch = 1
        }
    }
    
    private func loadOnBoardViewController() {
        let storyBoard = UIStoryboard(name:"Main", bundle: nil)
        let onboardViewController = storyBoard.instantiateViewController(withIdentifier: OnBoardingViewController.STORYBOARD_ID)
        self.window.rootViewController = onboardViewController
        self.window.makeKeyAndVisible()
     }
}

struct InitializeAppearanceCommand: Command {
    func execute() {
        // Setup UIAppearance
    }
}

